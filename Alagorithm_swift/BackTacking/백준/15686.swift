//
//  15686.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/21/24.
//

import Foundation
let n = Int(readLine()!)!
let aArrays = readLine()!.split(separator: " ").map{ Int(String($0))!}
let tools = readLine()!.split(separator: " ").map{ Int(String($0))!}
var resultMax = Int.min
var resultMin = Int.max

func dfs(_ cnt: Int, _ values: Int, pluss: Int, minuss: Int, mlutis: Int, divides: Int) {
    if cnt == n {
        resultMax = max(resultMax,values )
        resultMin = min(resultMin, values)
        return
    }
    if pluss > 0 {
        dfs(cnt + 1, values + aArrays[cnt], pluss: pluss - 1, minuss: minuss, mlutis: mlutis, divides: divides)
    }
    if minuss > 0 {
        dfs(cnt + 1, values - aArrays[cnt], pluss: pluss, minuss: minuss - 1, mlutis: mlutis, divides: divides)
    }
    if divides > 0 {
        dfs(cnt + 1 , values / aArrays[cnt], pluss: pluss, minuss: minuss, mlutis: mlutis, divides: divides - 1)

    }
    if mlutis > 0 {
        dfs(cnt + 1, values * aArrays[cnt] , pluss: pluss, minuss: minuss, mlutis: mlutis - 1 , divides: divides)
    }

}
dfs(1, aArrays[0], pluss: tools[0], minuss: tools[1], mlutis: tools[2], divides:  tools[3])
print(resultMax)
print(resultMin)
