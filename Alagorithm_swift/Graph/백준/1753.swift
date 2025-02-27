//
//  1753.swift
//  Alogrithm2
//
//  Created by Sunho on 11/14/24.
//

import Foundation
let ve = readLine()!.split(separator: " ").map{Int(String($0))!}, v = ve[0], e = ve[1]
let startPoint = Int(readLine()!)!
var graph = [[Data]](repeating: [], count: v + 1)
struct Data: Comparable {
    static func < (lhs: Data, rhs: Data) -> Bool {
        return lhs.cost < rhs.cost
    }
    let node: Int
    let cost: Int
}
for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1], cost = input[2]
    graph[a].append(Data(node: b, cost: cost))
}
let INF = 1_234_567_890
var distance = [Int](repeating: INF, count: v + 1)
struct PriorityQueue<T: Comparable> {
    private var comparer: (T, T ) -> Bool
    private var data: [T] = []
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    var top: T? {
        return isEmpty ? nil : data[1]
    }
    var isEmpty {
        return data.count <= 1
    }
    mutating func enqueue(_ element: T) {
        if isEmpty {
            data.append(element)
            data.append(element)
            return
        } else {
            data.append(element)
            swimUP(index: data.count - 1)
        }
    }
    mutating func swimUP(index: Int) {
        var index = index
        while index > 1 && comparer(data[index], data[index/2]) {
            data.swapAt(index , index / 2)
            index /= 2
        }
    }
    mutating func pop() -> T? {
        if isEmpty { return nil}
        data.swapAt(1, data.count - 1)
        let delete = data.removeLast()
        driveDown(index: 1)
        return delete
        
    }
    mutating func driveDown(index: Int) {
        var swapIndex = index
        var isSwap = false
        let leftindex = index * 2
        let rightIndex = index * 2 + 1
        if leftindex < data.count && comparer(data[leftindx], data[swapIndex]) {
            swapIndex = leftindex
            isSwap = true
        }
        if rightIndex < data.count && comparer(data[rightIndex], data[swapIndex]) {
            swapIndex = rightIndex
            isSwap = true
        }
        if isSwap {
            data.swapAt(swapIndex, index)
            driveDown(index: swapIndex)
        }
    }
}


func dijkstra(start: Int) {
    var heap = PriorityQueue<Data>(comparer: <)
    distance[startPoint] = 0
    heap.insert(element: Data(node: start, cost: 0))
    while !heap.isEmpty {
        let now = heap.pop()!
        if distance[now.node] < now.cost {
            continue
        }
        for next in graph[now.node] {
            let cost = now.cost + next.cost
            if cost < distance[next.node] {
                distance[next.node] = cost
                heap.insert(element: Data(node: next.node, cost: cost))
            }
        }
    }
}
dijkstra(start: startPoint)

distance[1...].forEach { print($0 == INF ? "INF" : $0) }
