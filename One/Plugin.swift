import Foundation
import CommonInterface

public class Plugin : PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "One.Framework.Plugin"

    public required init() {

    }
}

public class PluginV2 : PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "One.Framework.PluginV2"

    public required init() {

    }
}
