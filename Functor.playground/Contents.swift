import Foundation


// Functor 

let intMaybe = Maybe<Int>(with: 12)
let c: Maybe<String> = intMaybe.fmap{ "\($0)" }
c.value

let strMaybe = Maybe<String>(with: "You")
let mappedStrMaybe: Maybe<String> = strMaybe.fmap{ $0 + ": The Great" }
mappedStrMaybe.value


// Nothing / None value
let intMaybe2 = Maybe<Int>()
let d: Maybe<Int> = intMaybe2.fmap{ $0 * 2 }
d.value



let arr = [1,2,3,4,5,6]
let barr: Array<Int> = arr.fmap{ $0 * 3 }
barr

//let optInt: Int? = 12
//let optMapped: String? = optInt.fmap{ "\($0 * 2)" }
//optMapped


/// This will crash

//let optInt2: Int? = nil
//let optInt2Mapped : String? = optInt2.fmap{ "\($0)" }
//optInt2Mapped


// Functor Pure 
let some: Maybe<Int> = Maybe<Int>.pmap(f: { $0 * 2})(Maybe<Int>(with: 12))
some.value


// It would be nice if we could get auto type inference to Maybe<Int> and 
// would be nice if we could used pmap as a global function rather than a 
// type function
let halfAppliedFn: ((Maybe<Int>) -> Maybe<Int>) = Maybe<Int>.pmap(f: {$0 * 100 })

// halfAppliedFn is a function lifting
let Mult200: Maybe<Int> = halfAppliedFn(Maybe<Int>(with: 200))
Mult200.value




let fnArray1 = [1,2,3,4,5,6]
let arr2:Array<Int> = Array<Int>.pmap(f: { $0 * 2})(fnArray1)

arr2
