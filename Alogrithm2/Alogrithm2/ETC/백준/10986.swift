//
//  10986.swift
//  Alogrithm2
//
//  Created by Sunho on 2/6/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var arrs = readLine()!.split(separator: " ").map{Int(String($0))!}
for i in 1..<n {
    arrs[i] += arrs[i-1]
}
// **나머지 개수 저장**
let divideArrs = arrs.map { $0 % m }
var counts = Array(repeating: 0, count: m)

// **나머지 개수 세기**
for num in divideArrs {
    counts[num] += 1
}
func combination(n: Int) -> Int {
    if n < 2 {return 0}
    return n * (n-1) / 2
}

var ans = 0
for i in counts {

    ans += combination(n: i)
}
print(ans + counts[0])
