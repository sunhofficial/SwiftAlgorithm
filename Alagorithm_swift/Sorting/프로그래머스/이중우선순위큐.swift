//
//  이중우선순위큐.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/28/24.
//

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    for i in operations {
        let commands = i.split(separator: " ").map {String($0)}
        if commands[0] == "I" { queue.append(Int(commands[1])!)}
        else if commands[0] == "D" && !queue.isEmpty {
            if commands[1].contains("-") {
                queue.sort(by:>)
                queue.removeLast()
            }
            else {
                 queue.sort()
                 queue.removeLast()
                 }
        }
    }
    return queue.isEmpty ? [0,0] : [queue.max()!, queue.min()!]
}
