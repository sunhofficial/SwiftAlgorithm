//
//  main.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/8/24.
//


import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var dicts = [String: [String]]()
    for ticket in tickets {
        dicts[ticket[0], default: []].append(ticket[1])
    }
    print(dicts)
       for key in dicts.keys {
        dicts[key]!.sort()
    }
     print(dicts)
    var queue = ["ICN"]
    var index = 0

//    func dfs(_ current: String) -> Bool {
//        if queue.count == tickets.count + 1 {
//            return true
//        }
//        guard let desti = dicts[current] else {return false}
//        for i in 0..<desti.count {
//            let next = desti[i]
//            dicts[current]?.remove(at: i)
//            queue.append(next)
//            if dfs(next) {
//                return true
//            }
//
//        }
//    }
    while index < queue.count  {
        if index == tickets.count + 1 {
            return queue
        }
        let current = queue[index]
        index += 1
        if let destinations = dicts[current], destinations.count > 0 {
            queue.append(destinations[0])
            dicts[current]!.removeFirst()
        }
    }
    return queue
}

print(solution([["ICN", "BOO"], ["ICN", "COO"], ["COO", "DOO"], ["DOO", "COO"], ["BOO", "DOO"], ["DOO", "BOO"], ["BOO", "ICN"], ["COO", "BOO"]]))
