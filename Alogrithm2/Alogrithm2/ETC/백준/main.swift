//
//  22867.swift
//  Alogrithm2
//
//  Created by Sunho on 11/10/24.
//

import Foundation
let n = Int(readLine()!)!
var totaltimes = [[String]]()
for i in 0..<n {
    let times = readLine()!.split(separator: " ").map{String($0)}
    totaltimes.append([times[0],"1"])
    totaltimes.append([times[1],"-1"])
}

totaltimes.sort {
    if $0[0] == $1[0] {
        return $0[1] > $1[1]
    } else {
        return $0[0] < $1[0]
    }
}

var result = 0
var answer = 0
for time in totaltimes {
    result += Int(time[1])!
    answer = max(answer, result)
}

print(answer)
