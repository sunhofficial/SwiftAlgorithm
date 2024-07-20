//
//  6603.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/19/24.
//

import Foundation

while true {
    let inputlines = readLine()!.split(separator: " ").map {Int(String($0))!}
    let k = inputlines[0]
    if k == 0 {
        break
    }
    let nums = Array(inputlines[1...])
    var results = [Int]()
    dfs(0)
    print("")

    func dfs( _ depth: Int) {
        if results.count == 6 {
            print(results.map {String($0)}.joined(separator: " "))
            return
        }
        for i in depth..<k{
            results.append(nums[i])
            dfs( i + 1)
            results.removeLast()
        }
    }
}


