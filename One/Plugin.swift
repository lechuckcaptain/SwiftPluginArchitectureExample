import Foundation
import CommonInterface

public class Plugin : PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "One"

    public required init() {

    }
}

public class PluginV2 : PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "OneV2"

    public required init() {

    }
}
