//
//  K번째.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/1/24.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var ans: [Int] = []
    for command in commands {
        let start = command[0] - 1
        let end = command[1]
        let target = command[2] - 1
        var temp = array[start..<end]
        ans.append(temp.sorted()[target])
    }
    return ans
}
