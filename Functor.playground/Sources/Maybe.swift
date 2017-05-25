import Foundation

public struct Maybe<T> {

    public let value: Optional<Any>

    public init() {
        value = .none
    }

    public init(with: T) {
        value = .some(with as Any)
    }

}


extension Maybe: Functor {

    public func fmap<F, B>(_ by: ((T) -> B)) -> F where F : Functor, F.A == B {
        switch self.value {
        case .none:
            return Maybe<B>() as! F
        case .some(let v):
            let newv = by(v as! T)
            return Maybe<B>(with: newv) as! F
        }
    }
    
}

//extension Maybe: Functor2 {
//    public typealias A = T
//
//    public func fmap<B, F>(_ by: ((T) -> B)) -> F where F : Functor2 {
//        switch self.value {
//        case .none:
//            return Maybe<B>() as! F
//        case .some(let v):
//            let properV = v as! T
//            let fv = by(properV)
//            return Maybe<B>(with: fv) as! F
//        }
//    }
//
//}

//extension Maybe: Functor3 {
//    public typealias A = T
//
//    public func fmap<B, U>(_ by: (T) -> B) -> U where U : Functor3, U.A == B {
//        switch self.value {
//        case .none:
//            return Maybe<B>() as! U
//        case .some(let v):
//            let pv = v as! T
//            let pvf = by(pv)
//            return Maybe<B>(with: pvf) as! U
//        }
//    }
//
//}
