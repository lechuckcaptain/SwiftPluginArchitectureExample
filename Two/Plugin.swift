//
//  Plugin.swift
//  Two
//
//  Created by Marco Pagliari on 27/09/2019.
//  Copyright © 2019 Marco Pagliari. All rights reserved.
//

import Foundation
import CommonInterface

public class Plugin : PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "Two.Bundle.Plugin"

    public required init() {

    }
}

public class PluginV2 : PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "Two.Bundle.PluginV2"

    public required init() {

    }
}
