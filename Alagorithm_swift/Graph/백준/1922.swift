//
//  1922.swift
//  Alogrithm2
//
//  Created by Sunho on 12/22/24.
//

import Foundation
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n + 1)
var lines = [[Int]]()
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}, a = abc[0], b = abc[1], c = abc[2]
    lines.append([a,b,c])
}
lines.sort { $0[2] < $1[2]}
var parents = Array(repeating: 0, count: n + 1)
for i in 1...n {
    parents[i] = i
}


func findParent(_ node: Int) -> Int{
    if parents[node] == node {return node}
    parents[node] = findParent(parents[node])
    return parents[node]
}
func union(_ a:Int, _ b: Int) {
    let aparent = findParent(a)
    let bparent = findParent(b)
    parents[aparent] = bparent
}

var answer = 0
for line in lines {
    if findParent(line[0]) == findParent(line[1]) { continue}
    union(line[0],line[1])
    answer += line[2]
    
}
print(answer)
