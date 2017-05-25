import Foundation


// Functor 

let intMaybe = Maybe<Int>(with: 12)
let c: Maybe<String> = intMaybe.fmap{ "\($0)" }
c.value

let strMaybe = Maybe<String>(with: "Bj Kandel")
let mappedStrMaybe: Maybe<String> = strMaybe.fmap{ $0 + ": The Great" }
mappedStrMaybe.value


let intMaybe2 = Maybe<Int>()
let d: Maybe<Int> = intMaybe2.fmap{ $0 * 2 }
d.value



let arr = [1,2,3,4,5,6]
let barr: Array<Int> = arr.fmap{ $0 * 3 }
barr

let optInt: Int? = 12
let optMapped: String? = optInt.fmap{ "\($0 * 2)" }
optMapped


let optInt2: Int? = nil
let optInt2Mapped : String? = optInt2.map{ "\($0)" }
optInt2Mapped



// Applicative Functor 
