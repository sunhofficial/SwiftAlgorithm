//
//  14888.swift
//  Alogrithm2
//
//  Created by Sunho on 5/14/25.
//

import Foundation
let n = Int(readLine()!)!
let arrays = readLine()!.split(separator: " ").map{Int(String($0))!}
var countingOper = readLine()!.split(separator: " ").map{Int(String($0))!}
func add(_ x: Int, _ y : Int) -> Int {x+y}
func minus(_ x: Int, _ y : Int) -> Int {x-y}
func multiply(_ x: Int, _ y : Int) -> Int {x*y}
func divide(_ x: Int, _ y : Int) -> Int {x/y}
let operations = [add,minus,multiply,divide]

var result = [Int]()
func dfs(_ count: Int, _ value:Int) {
    if count == n {
        result.append(value)
        return
    }
    for i in 0..<4 {
        if countingOper[i] != 0 {
            countingOper[i] -= 1
            dfs(count+1, operations[i](value,arrays[count]))
            countingOper[i] += 1
        }
    }
}
dfs(1,arrays[0])
print(result.max()!)
print(result.min()!)
