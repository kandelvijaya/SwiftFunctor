import Foundation

/**
 A functor is a container type that provides a interface though which 
 the client can supply a function that will be applied to all the 
 internal items.
 
 - NOTE: Functor in easy way can be seen as type that is mappable.
 

 For instance; Optional<Wrapped>, Array<Element> are Functors to name a few.
 However, Swift doesnot have a Functor type. These 2 types exhibit 
 Functor nature not by compliance to type but by mere informal method.
 
 
 For example:
 We are looking semantically for a function like such.
 ```
 struct Maybe<A> {
    func fmap(_ by: (A) -> B) -> Maybe<B> {...}
 }
 ```
 
 Due to the limitation on Self type and Protocol<X>; we cannot model 
 functor with the same syntax as above. We can however semantically 
 perform the same operation. The call site will look like this:
 ```
 let intMaybe = Maybe<Int>(with: 12)
 let c: Maybe<String> = intMaybe.fmap{ "\($0)" }
 c.value    // "24"
 ```
 
 NOTE: `let c: Maybe<String>` is used to store returned Functor into a 
 complete representable type. Functor is a Generic Type.
 */
public protocol Functor {

    associatedtype A

    /**
     Maps over the current functor by applying function `by` to produce another functor.

     - parameter by: Takes function `(A) -> B`
     - description `A`: type of each item in current Functor.
     - description `B`: type of each item that will be in the return Functor.
     */
    func fmap<F: Functor, B>(_ by: ((A) -> B)) -> F where F.A == B
    
}


protocol Functor2 {

    associatedtype A

    // This returns Functor2 which doesnot constraint the internal items to be of type B
    // this is bad by design
    func fmap<B, F: Functor2>(_ by: ((Self.A) -> B)) -> F

}
