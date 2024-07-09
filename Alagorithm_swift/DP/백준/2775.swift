//
//  2775.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/9/24.
//

import Foundation
let t = Int(readLine()!)!
for i in 0..<t {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    var arr = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)

    for x in 0..<k+1 {
        for v in 0..<n + 1 {
            if x == 0 {
                arr[x][v] = v + 1
            } else {
                if v == 0 {
                    arr[x][v] = 1
                } else {
                    arr[x][v] = arr[x-1][v] + arr[x][v-1]
                }
            }
        }
    }


    print("\(arr[k][n-1])")
}
