//
//  산모양타일링.swift
//  Alogrithm2
//
//  Created by Sunho on 11/15/24.
//

import Foundation

func solution(_ n:Int, _ tops:[Int]) -> Int {
    var adp = Array(repeating: 0, count: n+1) // 3번방법만
    var bdp = Array(repeating: 0, count: n+1) // 3번빼고
     adp[1] = 1
     bdp[1] = tops[0] == 1 ? 3 : 2
    if n == 1 {
        return adp[1] + bdp[1]
    }
    for i in 2..<n+1 {
        if tops[i-1] == 0 {
            adp[i] = adp[i-1] + bdp[i-1]
            bdp[i] = adp[i-1] + 2 * bdp[i-1]
        } else {
            adp[i] =  adp[i-1] + bdp[i-1]
            bdp[i] = 2 * adp[i-1] + 3 * bdp[i-1]
        }
        adp[i] %= 10007
        bdp[i] %= 10007
    }
    return (adp[n] + bdp[n]) % 10007
}
