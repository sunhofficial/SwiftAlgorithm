//
//  11000.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/1/24.
//

import Foundation

struct PriorityHeap<T> {
    private var heap = [T]()
    private let compare: (T, T) -> Bool

    var top: T? {
        return heap.first
    }

    var count: Int {
        return heap.count
    }

    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }

    mutating func insert(_ element: T) {
        var childIndex = heap.count
        heap.append(element)
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && compare(heap[childIndex], heap[parentIndex]) {
            heap.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }

    mutating func pop() -> T? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeLast() }
        let topElement = heap[0]
        heap[0] = heap.removeLast()
        var parentIndex = 0

        while true {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2
            var minIndex = parentIndex

            if leftChildIndex < heap.count && compare(heap[leftChildIndex], heap[minIndex]) {
                minIndex = leftChildIndex
            }

            if rightChildIndex < heap.count && compare(heap[rightChildIndex], heap[minIndex]) {
                minIndex = rightChildIndex
            }

            if minIndex == parentIndex { break }

            heap.swapAt(parentIndex, minIndex)
            parentIndex = minIndex
        }

        return topElement
    }
}

let n = Int(readLine()!)!
var intervals = [(Int, Int)]()

for _ in 0..<n {
    let st = readLine()!.split(separator: " ").map { Int(String($0))! }
    intervals.append((st[0], st[1]))
}

intervals.sort { $0.0 < $1.0 }

var minHeap = PriorityHeap<Int>(compare: <)

for interval in intervals {
    if let earliestEnd = minHeap.top, earliestEnd <= interval.0 {
        _ = minHeap.pop()
    }
    minHeap.insert(interval.1)
}

print(minHeap.count)

//func greedyAlgoritim(nums: [Int]) {
//    if greedyArr.isEmpty {
//        greedyArr.append(nums)
//    } else {
//        var lastval = 0
//        var adding = false
//        for i in 0..<greedyArr.count {
//            if greedyArr[i].last! <= nums[0] && greedyArr[lastval].last! <= greedyArr[i].last! {
//                lastval = i
//                adding = true
//            }
//        }
//        if adding {
//            greedyArr[lastval] += nums
//        } else {
//            greedyArr.append(nums)
//        }
//    }
//}
//print(greedyArr.count)
