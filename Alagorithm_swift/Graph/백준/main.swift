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
for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1], cost = input[2]
    graph[a].append(Data(node: b, cost: cost))
}
let INF = 1_234_567_890
var distance = [Int](repeating: INF, count: v + 1)

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private var comparer: (T,T) -> Bool
    var isEmpty: Bool {
        return elements.count <= 1
    }
    var top: T? {
        return isEmpty ? nil : elements[1]
    }
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    mutating func insert(element: T ) {
        if elements.isEmpty {
            elements.append(element)
            elements.append(element)
            return
        } else {
            elements.append(element)
            swimUp(index: elements.count - 1)
        }
        
    }
    mutating func swimUp(index: Int) {
        var index = index
        while index > 1 && comparer(elements[index] , elements[index / 2]) {
            elements.swapAt(index, index / 2)
            index /= 2
        }
    }
    mutating func pop() -> T? {
        if elements.count <  2 {return nil}
        elements.swapAt(1, elements.count - 1)
        let deleteElement = elements.removeLast()
        driveDown(index: 1)
        return deleteElement
    }
    mutating private func driveDown(index: Int) {
        var swapIndex = index
        var isSwap = false
        let leftIndex = index * 2
        let rightIndex = index * 2 + 1
        if leftIndex < elements.endIndex && comparer(elements[leftIndex], elements[swapIndex]) {
            swapIndex = leftIndex
            isSwap = true
        }
        if rightIndex < elements.endIndex && comparer(elements[rightIndex], elements[swapIndex]) {
            swapIndex = rightIndex
            isSwap = true
        }
        if isSwap {
            elements.swapAt(swapIndex, index)
            driveDown(index: swapIndex)
        }
    }
}
struct Data: Comparable {
    static func < (lhs: Data, rhs: Data) -> Bool {
        return lhs.cost < rhs.cost
    }
    let node: Int
    let cost: Int
}

func dijkstra(start: Int) {
    var heap = Heap<Data>(comparer: <)
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
