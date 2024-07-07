import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var queue: [(start: String, cnt: Int )] = []
    queue.append((begin, 0))
    var visited = Array(repeating: false, count : words.count)
    var index = 0
    while index <= words.count {
        let first = queue[index]
        if first.0 == target {
            return first.1
        } else {
            for (idx, word) in words.enumerated() {
                if isOneDifference(first.0, word) && !visited[idx]{
                    visited[idx]  = true
                    queue.append((word, first.1 + 1))
                }
            }
            index += 1
        }
    }
    return 0
}
func isOneDifference(_ begin: String, _ target: String) -> Bool {
    var fArray = Array(begin)
    var sArray = Array(target)
    var cnt = 0
    for i in 0 ..< fArray.count {
        if fArray[i] != sArray[i] {
            cnt += 1
        }
    }
    if cnt > 1 {
        return false
    } else {
        return true
    }
}//
//  단어변환.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/7/24.
//

import Foundation
