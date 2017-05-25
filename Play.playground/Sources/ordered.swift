import Foundation

/*
 class Ordered {
 func preceeds(other: Ordered) -> Bool {
 fatalError("Implement this one")    // First sign of fighting type system
 }
 }

 class Number: Ordered {
 var value: Double = 0
 override func preceeds(other: Ordered) -> Bool {
 // This could trap if other is something else
 // Some type relation is lost when `as! SubClass` is met.
 return value < (other as! Number).value
 }
 }

 func binarySearch(sortedKeys: [Ordered], forKey k: Ordered) -> Int {
 var lo = 0, hi = sortedKeys.count
 while hi > lo {
 let mid = lo + (hi - lo) / 2
 if sortedKeys[mid].preceeds(other: k) {
 lo = mid + 1
 } else {
 hi = mid
 }
 }
 return lo
 }

 */

//// Using protocol
//
//protocol OrderedP {
//    // Self requirement
//    // Placeholder for the type thats going to conform:: model Type
//    func preceeds(other: Self) -> Bool
//
//    func eqaul(other: Self) -> Bool
//}
//
//struct NumberV: OrderedP {
//    var value:Double
//
//    func preceeds(other: NumberV) -> Bool {
//        // get rid of this downcast
//        return self.value < other.value
//    }
//
//    func eqaul(other: NumberV) -> Bool {
//        return self.value == other.value
//    }
//
//}
//
//
//func bSearchR<T: OrderedP>(sortedKeys: [T], forKey k: T) -> Int? {
//    if sortedKeys.isEmpty {  return nil }
//    let pairs = sortedKeys.enumerated().map{ ($0.offset, $0.element) }
//    print(pairs)
//    return bSearchRImpl(keys: pairs, forKey: k)
//}
//
//func bSearchRImpl<T: OrderedP>(keys: [(Int, T)], forKey k: T) -> Int? {
//    if keys.isEmpty { return nil }
//    let mid = keys.count / 2
//    print(mid)
//
//    if keys.count == 1 {
//        return keys.first!.1.eqaul(other: k) ? keys.first!.0 : nil
//    }
//
//    if keys[mid].1.eqaul(other: k) {
//        return keys[mid].0
//    }
//
//    if keys[mid].1.preceeds(other: k) {
//        let low = mid
//        let high = keys.count
//        return bSearchRImpl(keys: Array(keys[low..<high]), forKey: k)
//    } else {
//        return bSearchRImpl(keys: Array(keys[0..<mid]), forKey: k)
//    }
//}
//
//
//func testbSearch() {
//    let listNums = Array(0...190).map{ NumberV(value: Double($0)) }
//    let x = bSearchR(sortedKeys: listNums, forKey: NumberV(value: 2))
//    print(x as Any)
//}

//testbSearch()
