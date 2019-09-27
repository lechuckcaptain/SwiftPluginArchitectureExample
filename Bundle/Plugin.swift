//
//  Plugin.swift
//  Bundle
//
//  Created by Marco Pagliari on 26/09/2019.
//  Copyright © 2019 Marco Pagliari. All rights reserved.
//

import Foundation
import CommonInterface

public class Plugin : PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "Bundled"

    public required init() {

    }
}

public class PluginV2 : PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "BundledV2"

    public required init() {

    }
}
