//
//  Test.swift
//  Alogrithm2
//
//  Created by Sunho on 8/17/24.
//
import Foundation
let n = Int(readLine()!)!
var arrs = Array(readLine()!)
var index = 0
while arrs.count - 2 > index {
    if arrs[index] == "P" && arrs[index + 1] == "S" && (arrs[index + 2 ] == "4" || arrs[index + 2] == "5"){
        arrs.remove(at: index + 2)
        index = 0
    } else {
        index += 1
    }
}
print(String(arrs))
