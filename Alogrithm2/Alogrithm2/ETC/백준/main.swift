//
//  6588.swift
//  Alogrithm2
//
//  Created by Sunho on 3/7/25.
//

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var cards = readLine()!.split(separator: " ").map{Int(String($0))!}
cards.sort(by: >)

for _ in 0..<m {
    let temp = cards[n - 1] + cards[n - 2]
    cards[n - 1 ] = temp
    cards[n - 2 ] = temp
    cards.sort(by: >)
}
var answer = 0
for i in cards {
    answer += i
}

print(answer)
