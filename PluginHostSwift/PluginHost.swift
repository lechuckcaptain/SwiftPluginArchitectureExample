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

        print("Loaded bundles \(bundles.map { $0.lastPathComponent })")

        for bundleUrl in bundles {
            print("Loading framework: \(bundleUrl.lastPathComponent)")

            if let bundle = Bundle(url: bundleUrl) {

                let name = bundleUrl.deletingPathExtension().lastPathComponent
                print("Name:", name)

                let typeNamed = bundle.classNamed(name + ".Plugin") as? PluginInterface.Type
                let typeNamedV2 = bundle.classNamed(name + ".PluginV2") as? PluginInterface.Type
                let typePrincipal = bundle.principalClass as? PluginInterface.Type

                if let cls = bundle.classNamed(name + ".Plugin") as? PluginInterface.Type {
                    let plugin = cls.init()
                    plugin.doSomething()
                }

                print("From bundle.classNamed: \(initPlugin(from: typeNamed)?.description ?? "")" )
                print("From bundle.classNamed: \(initPlugin(from: typeNamedV2)?.description ?? "")" )
                print("From bundle.principalClass: \(initPlugin(from: typePrincipal)?.description ?? "")" )
            }
        }
    }

    func initPlugin(from type: PluginInterface.Type?) -> PluginInterface? {

        if let cls = type {
            let plugin = cls.init()
            plugin.doSomething()
        }

        return nil
    }
}
