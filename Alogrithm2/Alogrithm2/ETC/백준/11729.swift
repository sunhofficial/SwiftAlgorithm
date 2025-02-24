//11729
import Foundation
let n = Int(readLine()!)!
var maps = Array(repeating: [Int](), count: 3)
maps[0] = Array(1...n).reversed()
var result = ""
func hanoi(_    n: Int, _ from: Int, _ to: Int, _ via: Int) {
    if n == 1{
        result += "\(from) \(to)\n"
        return
    }
    hanoi(n-1, from, via, to)
    result += "\(from) \(to)\n"
    hanoi(n - 1, via, to, from)
    
}
print("\(Int(pow(2.0, Double(n))) - 1)")
hanoi(n, 1, 3, 2)
print(result)
