//
//  2531.swift
//  Alogrithm2
//
//  Created by Sunho on 3/3/25.
//
//슬라이딩윈도우
import Foundation

import Foundation

let ndkc = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = ndkc[0], d = ndkc[1], k = ndkc[2], c = ndkc[3]
var queue = [Int]()
for _ in 0..<n {
    queue.append(Int(readLine()!)!)
}

// 빈도 수를 관리할 Dictionary
var countDict = [Int: Int]()

// 초기 윈도우 설정 (0..<k)
for i in 0..<k {
    countDict[queue[i], default: 0] += 1
}
countDict[c, default: 0] += 1 // 쿠폰 초밥 항상 포함
var result = countDict.count

// 슬라이딩 윈도우
for i in 1..<n {
    // 윈도우에서 빠지는 초밥
    let removeSushi = queue[i-1]
    countDict[removeSushi]! -= 1
    if countDict[removeSushi] == 0 {
        countDict.removeValue(forKey: removeSushi)
    }
    
    // 윈도우에 추가되는 초밥
    let nextIndex = (i + k - 1) % n
    countDict[queue[nextIndex], default: 0] += 1
    
    // 쿠폰 초밥 항상 포함
    countDict[c, default: 0] += 1
    
    result = max(result, countDict.count)
    if result == d {
        break
    }
}

print(result)
