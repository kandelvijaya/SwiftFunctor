import Foundation

protocol Functor2 {

    associatedtype A

    // This returns Functor2 which doesnot constraint the internal items to be of type B
    // this is bad by design
    func fmap<B, F: Functor2>(_ by: ((Self.A) -> B)) -> F

}


// this is the same as the first one
protocol Functor3 {

    associatedtype A

    // This is essentially the same as the first one
    // How can we get the proper type Maybe<B>
    func fmap<B, U>(_ by: (Self.A) -> B) -> U where U : Functor3, U.A == B
    
}
