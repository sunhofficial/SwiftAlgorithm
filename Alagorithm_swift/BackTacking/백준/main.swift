//
//  2529.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/22/24.
//

import Foundation
let k = Int(readLine()!)!
let inputs = readLine()!.split(separator: " ").map {String($0)}
var visited = Array(repeating: false, count: 10)
var maxValue = ""
var minValue = ""
func isValid(_ a: Character, _ b: Character, _ operation: String) -> Bool {
    if operation == "<" {
        return a < b
    }else {
        return a > b
    }
}
func dfs(_ cnt: Int, answer: String) {
    if cnt == k + 1 {
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
            if cnt == 0 || isValid(answer.last!, Character(String(i)), inputs[cnt - 1]) {
                visited[i] = true
                dfs(cnt + 1, answer:  answer + String(i))
                visited[i] = false
            }
        }
    }
}
dfs(0, answer: "")
print(maxValue)
print(minValue)
//처음엔 다 탐색하는 거였지만 두번째에는 조건을 넣어주었음 애초에 isValid를 통해 dfs전에 조건을 따짐.
