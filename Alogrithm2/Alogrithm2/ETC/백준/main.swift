import Foundation

//2559
let nk = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nk[0], k = nk[1]
let maps = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = 0

for i in 0..<n-k {
    ans = max(ans, maps[i..<i+k].reduce(0, +))
    
}
print(ans)
// 1트 시간복잡도 Fail
