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
//처음엔 다 탐색하는 거였지만 두번째에는 조건을 넣어주었음 애초에 isValid를 통해 dfs전에 조건을 따짐. 그런데 모든 조건을 만족하는 것을 다 찾은 후 거기서 max min 을 비교하기에 시간은 좀더 높음. 다른 코드를 보면 애초에 9-8-7이런식으로 솔팅해서 때려버려 최초에 찾았다?= > 최대니까 종료. 0-1-2-하다가 최초로 찾앗다? 그게 최소니까 종료 이렇게 하면 시간이 8ms까지도 낮출수 있다.
