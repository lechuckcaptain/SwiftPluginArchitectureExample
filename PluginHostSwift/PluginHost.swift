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

    func loadPluginsFromPath(path: String)
    {
        let fileManager = FileManager.default
        let bundles = try? fileManager.contentsOfDirectory(atPath: path).filter { $0.hasSuffix("framework") }.compactMap { $0 }
        if let bundles = bundles {
            print(bundles)

            for name in bundles {
                print("Loading framework: \(name)")

                if let bundle = Bundle(path: name), bundle.load() {

                    let typeNamed = bundle.classNamed("One.Plugin") as? NSObject.Type
                    let typeNS = NSClassFromString("One.Plugin") as? NSObject.Type
                    let typeNamedV2 = bundle.classNamed("One.PluginV2") as? NSObject.Type
                    let typeNSV2 = NSClassFromString("One.PluginV2") as? NSObject.Type
                    let typePrincipal = bundle.principalClass as? NSObject.Type

                    print("From bundle.classNamed: \(initPlugin(from: typeNamed)?.description ?? "")" )
                    print("From NSClassFromString: \(initPlugin(from: typeNS)?.description ?? "")" )

                    print("From bundle.classNamed: \(initPlugin(from: typeNamedV2)?.description ?? "")" )
                    print("From NSClassFromString: \(initPlugin(from: typeNSV2)?.description ?? "")" )

                    print("From bundle.principalClass: \(initPlugin(from: typePrincipal)?.description ?? "")" )

                    bundle.unload()
                }
            }
        }
    }

    func initPlugin(from type: NSObject.Type?) -> PluginInterface? {

        if let t = type, let p = t.init() as? PluginInterface {
            return p
        }

        return nil
    }
}
