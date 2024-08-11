//
//  디스크컨트롤ㄹ.swift
//  Alogrithm2
//
//  Created by Sunho on 8/11/24.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var sortedBytime = jobs.sorted(by: {
       $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] > $1[0]
    })
    var jobQueue :[[Int]] = [sortedBytime.removeLast()]
    var times = 0
    var current = jobQueue.first![0]
    while !jobQueue.isEmpty {
        let now = jobQueue.removeLast()
        times += abs(current - now[0]) + now[1]
        current += now[1]
        while !sortedBytime.isEmpty && sortedBytime.last![0] <= current {
            jobQueue.append(sortedBytime.removeLast())
        }
        jobQueue.sort(by: {$0[1] > $1[1]})
        if jobQueue.isEmpty && !sortedBytime.isEmpty{
            jobQueue.append(sortedBytime.removeLast())
            current += abs(current - jobQueue.last![0])
        }
    }
    return times / jobs.count
}
