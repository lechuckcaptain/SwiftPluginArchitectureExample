import Foundation
import CommonInterface

public class Plugin : NSObject, PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "One"
}

public class PluginV2 : NSObject, PluginInterface
{
    public func doSomething() {
        print("\(name) is doing something")
    }

    public var name = "OneV2"
}
