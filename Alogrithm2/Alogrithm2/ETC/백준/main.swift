import Foundation

//2559
let nk = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nk[0], k = nk[1]
let maps = readLine()!.split(separator: " ").map{Int(String($0))!}
var sum = maps[0..<k].reduce(0, +)
var ans = sum


for i in k..<n {
    sum += maps[i] - maps[i - k]
    ans = max(sum,ans)
}
print(ans)
// 1트 시간복잡도 Fail
// tm
