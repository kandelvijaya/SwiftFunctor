import Foundation


extension Optional: Functor {

    public typealias A = Wrapped

    public func fmap<F, B>(_ by: ((Wrapped) -> B)) -> F where F : Functor, B == F.A {
        switch self {
        case .none:
            return Optional<B>.none as! F
        case .some(let v):
            let fv = by(v)
            return Optional<B>(fv) as! F
        }
    }

}
