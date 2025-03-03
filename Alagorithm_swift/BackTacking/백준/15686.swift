//
//  15686.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/21/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var maps = [[Int]]()
var chickens = [(Int,Int)]()
var houses = [(Int,Int)]()
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        maps.append(input)
        for k 0..<n {
            if input[k] == 1 {houses.append((i,k))}
            else if input[k] == 2 {chickens.append((i,k))}
        }
        
    }
var answer = Int.max
var visited = Array(repeating: false , count: chickens.count)
func dfs(_ start: Int, _ count: Int) {
    if count == m { //치킨집 다고름
        //거리를 구해보자구나.
        var totalDistance = 0
        for house in houses {
            var minDistance = Int.max

            for i in 0..<chickens.count {
                if visited[i] {
                    minDistance = min(minDistance , abs(house.0 - chickens[i].0) + abs(house.1 - chickens[i].1))
                }
            }
            totalDistance += minDistance
        }
        answer = min(totalDistance, answer)
        return
        
        
    }
    for i in start..<chickens.count {
        if !visited[i] {
            visited[i] = true
            dfs(i, count + 1)
            visited[i] = false
        }
    }
}
                                               
