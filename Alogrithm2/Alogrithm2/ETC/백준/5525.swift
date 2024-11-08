//
//  5525.swift
//  Alogrithm2
//
//  Created by Sunho on 11/7/24.
//

import Foundation
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var s = Array(readLine()!)
var cnt = 0
var i = 0
var result = 0
while i < m - 2 {
    if String(s[i...i+2]) == "IOI" {
        cnt += 1
        i += 2
        if cnt == n {
            cnt -= 1
            result += 1
        }
    } else {
        i += 1
        cnt = 0
    }
}
print(result)
