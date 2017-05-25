import Foundation

public protocol FunctorPure {
    associatedtype A1
    // There is no gurantee that F1 and F2 will be the same Functor type
    // One can be Maybe and the other can be List
    //static func fmap<T, U, F1: FunctorPure, F2: FunctorPure>(f: ((T) -> U), to: F1) -> F2 where F1.A == T, F2.A == U

    // static func fmap<T, U, F1: Self, F2: Self>(f: ((T) -> U), to: F1) -> F2 where F1.A == T, F2.A == U, F1 == F2
    // where clause cannot be attached to non-generic declaration
    // Self is not a generic declaration

    // we need to curry the thingie
    static func pmap<T, U, F1: FunctorPure, F2: FunctorPure>(f: @escaping ((T) -> U)) -> (F1) -> F2 where F1.A1 == T, F2.A1 == U
}

extension Maybe: FunctorPure {

    public typealias A1 = T

    public static func pmap<T, U, F1, F2>(f: @escaping ((T) -> U)) -> (F1) -> F2 where F1 : FunctorPure, F2 : FunctorPure, F1.A1 == T, F2.A1 == U {
        return { (functor1: F1) -> F2 in
            let maybe1 = functor1 as! Maybe
            switch maybe1.value {
            case .none:
                return Maybe<U>() as! F2
            case .some(let v):
                let fv = f(v as! T)
                return Maybe<U>(with: fv) as! F2
            }
        }
    }

}

extension Array: FunctorPure {

    public typealias A1 = Element

    public static func pmap<T, U, F1, F2>(f: @escaping ((T) -> U)) -> (F1) -> F2 where F1 : FunctorPure, F2 : FunctorPure, F1.A1 == T, F2.A1 == U {
        return { (functor1: F1) -> F2 in
            let list1 = functor1 as! Array
            var accumulator = [U]()
            for index in list1 {
                accumulator.append(f(index as! T))
            }
            return accumulator as! F2
        }
    }
    
}
