//
//  main.swift
//  PluginHostSwift
//
//  Created by Marco Pagliari on 25/09/2019.
//  Copyright © 2019 Marco Pagliari. All rights reserved.
//

import Foundation
import CommonInterface

print("Start plugin loading")

let pluginHost = PluginHost()
let path = Bundle.main.bundlePath
pluginHost.loadPluginsFromPath(path: ".")
pluginHost.plugins.forEach {
    $0.doSomething()
}

print("End plugin loading")

