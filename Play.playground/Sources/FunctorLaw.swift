import Foundation

func map<T, U>(inputFunctor:[T], transform: ((T) -> U)) -> [U] {
    var output: [U] = []
    for n in inputFunctor {
        let applied = transform(n)
        output.append(applied)
    }
    return output
}

public func id<T>(_ input: T) -> T {
    return input
}

/// LAW 1: functor applied with identity function is the same as input.
public func testLaw1() -> Bool {
    let inputFunctor = [1,2,3]
    let mappedFunctor: Array<Int> = inputFunctor.fmap(id)
    return inputFunctor == mappedFunctor
}

/// LAW 2: 
/// Composing 2 functions and mapping a functor with that composed function
/// is equal to mapping a functor with first function and then mapping that
/// output functor with second function
public func testLaw2() -> Bool {
    let mult2 = { x in x * 2 }
    let mult3 = { x in x * 3 }

    let inputFunctor = [1,2,3]
    let composedAppliedFunctor: Array<Int> = inputFunctor.fmap(mult2 <> mult3)

    // FIXME: Generic paramter F cannot be inferred
    // let anotherFunctor: Array<Int> = inputFunctor.fmap(mult2).fmap(mult3)

    let fstFunctor: [Int] = inputFunctor.fmap(mult2)
    let completeAppliedFunctor: [Int] = fstFunctor.fmap(mult3)

    return composedAppliedFunctor == completeAppliedFunctor
}
