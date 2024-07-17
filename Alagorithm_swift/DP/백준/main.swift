//
//  2565.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/17/24.
//

import Foundation
let n = Int(readLine()!)!
var arr = [(Int,Int)]()
for i in 0..<n {
    let ab = readLine()!.split(separator: " ").map {Int(String($0))!}, a = ab[0], b = ab[1]
    arr.append((a,b))
}
arr.sort(by: {$0.0 < $1.0})
let arrived = arr.map {$0.1}
var dp = Array(repeating: 1, count: 101)
for i in 1..<n {
    for j in 0..<i {
        if arrived[i] > arrived[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(n-dp.max()!)

//풀이: 이전꺼하고 비슷한데 줄의 시작점을 오름차순으로 정렬한 후 도착지점을 보았을때 최장순열을 찾아서 n에서 빼주면됨 -> 왜? 교차선이 생긴다는거는 오름차순이 아닌 역으로 가는거기에
