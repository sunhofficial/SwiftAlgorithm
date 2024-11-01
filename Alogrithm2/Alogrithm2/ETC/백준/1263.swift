//
//  1263.swift
//  Alogrithm2
//
//  Created by Sunho on 11/1/24.
//

import Foundation
/// i 번째 일하는데 정확히 t시간 걸리고 s시간 내에 해야한다. 주어진 예시로 생각을 해보자. 그런데 문제에서 총 일이 N개가 있는데 여기서 우선순위가 없는것 같다. 그냥 다 끝내면 된다.
/// 문제에서 주어진 시간 최대값 1,000,000, 출력할 최대 시작시간 1,000,000설정
/// 3,5 3시간 걸리고 5시간 내에 해야함.
/// 8시간 걸리고 14시간 내에 해야함
///결국 마감시간에 집중을 해야함.
/// 가장 시작을 마지막에 해서 다끝낼수 있게 해야하기에 현재 시작시간이 해당 작업의 마감시간보다 늦다면 해당작업은 task.1시점에 끝나야한다. 그래서 시작시점을 바꿔준다.
let n = Int(readLine()!)!
var time = 1000001
var tasks = [(Int,Int)]()
for _ in 0..<n {
    let ts = readLine()!.split(separator: " ").map{Int(String($0))!}
    tasks.append((ts[0], ts[1]))
}
tasks.sort {$0.1 > $1.1}
for task in tasks {
    if time > task.1 {
        time = task.1-task.0
    } else {
        time -= task.0
    }
}
print(time<0 ? -1 : time)
