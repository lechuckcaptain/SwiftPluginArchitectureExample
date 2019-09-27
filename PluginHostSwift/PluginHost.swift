//
//  PluginHost.swift
//  PluginHostSwift
//
//  Created by Marco Pagliari on 25/09/2019.
//  Copyright © 2019 Marco Pagliari. All rights reserved.
//

import Foundation
import CommonInterface

class PluginHost
{
    var plugins: [PluginInterface] = []

    func loadPlugins(at url: URL) {

        let fileManager = FileManager.default

        let bundles = (try? fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
            .filter { $0.pathExtension == "bundle"
                || $0.pathExtension == "framework"
            }) ?? []

        print("Found bundles/frameworks \(bundles.map { $0.lastPathComponent })")

        for bundleUrl in bundles {
            print("Loading bundle/framework: \(bundleUrl.lastPathComponent)")

            if let bundle = Bundle(url: bundleUrl) {

                let name = bundleUrl.deletingPathExtension().lastPathComponent
                print("Bundles/framework Name:", name)

                let typeNamed = bundle.classNamed(name + ".Plugin") as? PluginInterface.Type
                let typeNamedV2 = bundle.classNamed(name + ".PluginV2") as? PluginInterface.Type
                let typePrincipal = bundle.principalClass as? PluginInterface.Type

                if let p = initPlugin(from: typeNamed) { plugins.append(p) }
                if let p2 = initPlugin(from: typeNamedV2) { plugins.append(p2) }
                if let pp = initPlugin(from: typePrincipal) { plugins.append(pp) }
            }
        }

        print("Loaded plugins:\n\(plugins.map { "* \($0.name)" }.joined(separator: "\n"))")
    }

    func initPlugin(from type: PluginInterface.Type?) -> PluginInterface? {

        if let cls = type {
            let plugin = cls.init()
            return plugin
        }

        return nil
    }
}
