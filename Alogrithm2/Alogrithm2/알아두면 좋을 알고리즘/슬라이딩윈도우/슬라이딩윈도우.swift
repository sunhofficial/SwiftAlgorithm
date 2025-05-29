import Foundation
// 슬라이딩 윈도우
//2559
//let nk = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nk[0], k = nk[1]
//let maps = readLine()!.split(separator: " ").map{Int(String($0))!}
//var sum = maps[0..<k].reduce(0, +)
//var ans = sum
//
//
//for i in k..<n {
//    sum += maps[i] - maps[i - k]
//    ans = max(sum,ans)
//}
//print(ans)
// 1트 시간복잡도 Fail
// tm

//21921

//let nk = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nk[0], k = nk[1]
//let maps = readLine()!.split(separator: " ").map{Int(String($0))!}
//var sum = maps[0..<k].reduce(0, +)
//var answer = sum
//var temp = 1
//
//for i in k..<n {
//    sum += maps[i] - maps[i-k]
//    if sum == answer {
//        temp += 1
//    } else if sum > answer {
//        temp = 1
//        answer = sum
//    }
//}
//if answer == 0 {
//    print("SAD")
//} else {
//    print(answer)
//    print(temp)
//}


// 2003 연속된 수의 합이 K
let nk = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nk[0], k = nk[1]
let maps = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = 0
var sum = 0
var start = 0
for end in 0..<n {
    sum += maps[end]
    while sum > k {
        sum -= maps[start]
        start += 1
    }
    if sum == k {
        ans += 1
    }
    
}
print(ans)
