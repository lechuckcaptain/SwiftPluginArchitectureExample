//
//  Plugin.swift
//  Bundle
//
//  Created by Marco Pagliari on 26/09/2019.
//  Copyright © 2019 Marco Pagliari. All rights reserved.
//

import Foundation
import CommonInterface

public class Plugin : NSObject, PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "Bundled"
}

public class PluginV2 : NSObject, PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "BundledV2"
}
