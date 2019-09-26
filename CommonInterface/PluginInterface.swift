//
//  PluginInterface.swift
//  CommonInterface
//
//  Created by Marco Pagliari on 25/09/2019.
//  Copyright © 2019 Marco Pagliari. All rights reserved.
//

import Foundation

public protocol PluginInterface: CustomStringConvertible {

    var name: String { get }

    func doSomething()
}
