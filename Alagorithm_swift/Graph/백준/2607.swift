
//2607
import Foundation
let N = Int(readLine()!)!

var list = [[String]]()
for _ in 0..<N {
    let s = readLine()!.map{String($0)}
    list.append(s)
}
var ans = 0
let f = list[0]
for i in 1..<N {
    var check = Array(repeating: false, count: list[i].count)
    var l = 0
    for s in f {
        var match = false
        for j in list[i].indices {
            if check[j] {continue}
            if list[i][j] == s {
                check[j] = true
                match = true
                break
            }
        }
        if !match { l += 1}
    }
    let r = check.reduce(0, {$0 + ($1 == true ? 0 : 1)})
    if (l<2&&r<2) {
         ans += 1
     }

}
print(ans)
