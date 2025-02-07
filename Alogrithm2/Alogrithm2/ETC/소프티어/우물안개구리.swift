//
//  main.swift
//  Alogrithm2
//
//  Created by Sunho on 2/7/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var ws = readLine()!.split(separator: " ").map{Int(String($0))!}
var dict = [Int: [Int]]()
for i in 0..<m {
    let ab =  readLine()!.split(separator: " ").map{Int(String($0))!}
    dict[ab[0], default: []].append(ab[1])
    dict[ab[1],default: []].append(ab[0])
}
var ans = 0
for i in 1...n {
    let neighbors = dict[i] ?? [] // dict[i]가 없을 경우 빈 배열 사용
    var isBest = true
    for j in neighbors {
        if ws[i - 1] <= ws[j - 1] {  // ⚠️ i, j는 1-based이므로 0-based 인덱싱 적용
            isBest = false
            break
        }
    }
    if isBest {
        ans += 1
    }
}

print(ans)
