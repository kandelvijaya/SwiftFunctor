import Foundation


extension Optional: Functor {

    public typealias A = Wrapped

    public func fmap<F, B>(_ by: ((Wrapped) -> B)) -> F where F : Functor, B == F.A {
        switch self {
        case .none:
            // This will crash as as! is defined to crash when the left side is nil.
            // To mitigate this problem we have defined Maybe type which encapsulates Optional
            let none: Optional<B> = nil
            return none as! F
        case .some(let v):
            let fv = by(v)
            return Optional<B>(fv) as! F
        }
    }
    
}
