//12891
import Foundation
let sp = readLine()!.split(separator: " ").map{Int(String($0))!}, s = sp[0], p = sp[1]
let inputs = readLine()!.map{String($0)}
let acgt = readLine()!.split(separator: " ").map{Int(String($0))!}
var arrs = [0,0,0,0]
for k in 0..<p {
    updateCount(inputs[k], 1)
}
var ans = 0
ans += isPossible() ? 1 : 0
for i in p..<s {
    let next = inputs[i]
    let remove = inputs[i-p]
    updateCount(remove, -1)
    updateCount(next, 1)
    ans += isPossible() ? 1 : 0
}
print(ans)
func isPossible() -> Bool {
    if arrs[0] >= acgt[0] && arrs[1] >= acgt[1] && arrs[2] >= acgt[2] && arrs[3] >= acgt[3] {
        return true
    }
    return false
}
func updateCount(_ char: String, _ delta: Int) {
    switch char {
    case "A": arrs[0] += delta
    case "C": arrs[1] += delta
    case "G": arrs[2] += delta
    case "T": arrs[3] += delta
    default: break
    }
}
