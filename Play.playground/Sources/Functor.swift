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
 ```
 struct Maybe<A> {
    func fmap(_ by: (A) -> B) -> Maybe<B> {...}
 }
 ```
 */

