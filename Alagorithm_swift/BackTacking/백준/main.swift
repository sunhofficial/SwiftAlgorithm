//
//  2529.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/22/24.
//

import Foundation
let k = Int(readLine()!)!
let inputs = readLine()!.split(separator: " ")
var visited = Array(repeating: false, count: 10)
var maxValue = ""
var minValue = ""
func dfs(_ cnt: Int, answer: String) {
    if cnt == k + 1 {
        var arrAnswer = Array(answer)
        for (index, value) in inputs.enumerated() {
            if value == "<" && arrAnswer[index] < arrAnswer[index + 1]{
                continue
            }
            else if value == ">" && arrAnswer[index] > arrAnswer[index + 1] {
                continue
            }
            else {return}
        }
        if maxValue == "" || maxValue < answer {
            maxValue = answer
        }
        if  minValue == "" || minValue > answer{
            minValue = answer
        }
        return
    }
    for i in 0..<10 {
        if !visited[i] {
            visited[i] = true
            dfs(cnt + 1, answer:  answer + String(i))
            visited[i] = false
        }
    }
}
dfs(0, answer: "")
print(maxValue)
print(minValue)
