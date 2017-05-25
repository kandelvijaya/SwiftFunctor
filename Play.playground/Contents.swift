import Foundation

protocol Functor {
    associatedtype A

    func fmap<F: Functor, B>(_ by: ((A) -> B)) -> F where F.A == B

}

enum Maybe<A> {

    case Nothing
    case Something(A)

}

protocol MaybeP {
    associatedtype A
    init()
    init(with: A)
}

struct InstanceMaybeP<T>: MaybeP {

    let value: Optional<Any>

    init() {
        value = .none
    }

    init(with: T) {
        value = .some(with as Any)
    }

}


extension InstanceMaybeP: Functor {

    func fmap<F, B>(_ by: ((T) -> B)) -> F where F : Functor, F.A == B {
        switch self.value {
        case .none:
            return InstanceMaybeP<B>() as! F
        case .some(let v):
            let newv = by(v as! T)
            return InstanceMaybeP<B>(with: newv) as! F
        }
    }

}

let intMaybe = InstanceMaybeP<Int>(with: 12)
let c: InstanceMaybeP<String> = intMaybe.fmap{ "\($0)" }
c.value


let intMaybe2 = InstanceMaybeP<Int>()
let d: InstanceMaybeP<Int> = intMaybe2.fmap{ $0 * 2 }
d.value


let optInt = Optional<Int>(12)



//extension Functor where Self: Maybe<Wrapped> {
//
//    func fmap<F: Functor, B>(_ by: ((A) -> B)) -> F where F.A == B {
//
//    }
//
//}
