//
//  5568.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/18/24.
//

import Foundation
let n = Int(readLine()!)!
let k = Int(readLine()!)!
var cards = [Int]()
var visited = Array(repeating: false, count: n + 1)
for _ in 0..<n {
    cards.append(Int(readLine()!)!)
}
var answers = Set<Int>()
func dfs(cnt: Int, answer: String) {
    if cnt == k {
        answers.insert(Int(answer)!)
        return
    }
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            let temp = answer + "\(cards[i])"
            dfs(cnt: cnt + 1,answer:  temp )
            visited[i] = false
        }
    }
}
dfs(cnt: 0, answer: "")
print(answers.count)
