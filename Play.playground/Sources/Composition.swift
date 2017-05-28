import Foundation
precedencegroup FunctionApplicationPrecedence {
    associativity: right
}

infix operator <>:  FunctionApplicationPrecedence

public func <> <T,U, V>(value1: @escaping((U) -> V),  value2: @escaping ((T) -> U)) -> ((T)-> V) {
    return { x in
        return value1(value2(x))
    }
}
