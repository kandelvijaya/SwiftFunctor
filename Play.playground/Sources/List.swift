import Foundation

extension Array: Functor {

    public typealias A = Element

    public func fmap<F, B>(_ by: ((Element) -> B)) -> F where F : Functor, B == F.A {
        var accumulator = [B]()
        for index in self {
            accumulator.append(by(index))
        }
        return accumulator as! F
    }

}
