//
//  1339.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/4/24.
//

import Foundation
let n = Int(readLine()!)!
var arr: [[Character]]  = Array(repeating: [], count: n)
var dicts = [Character: Int]()
for i in 0..<n {
    let reads = Array(readLine()!)
    arr[i] = reads
}
for i in 0..<n {
    for j in 0..<arr[i].count {
        dicts[arr[i][j]] = (dicts[arr[i][j]] ?? 0 )+Int(pow(10, Double(arr[i].count - j - 1)))
    }
}
var temp = 9
var sum = 0
for i in dicts.sorted(by: {$0.value > $1.value }) {
    sum += i.value * temp
    temp -= 1
}
print(sum)
