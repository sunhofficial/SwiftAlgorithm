//
//  1005.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/3/24.
//

import Foundation
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}
let fIO = FileIO()
let t = fIO.readInt()
struct Queue {
    var queue = [Int]()
    var index = 0
    mutating func push(_ element: Int) {
        queue.append(element)
    }
    mutating func pop() -> Int {
        defer {
            index += 1
        }
        return  queue[index]
    }
    var isEmpty: Bool {
        return queue.count - index == 0 ? true : false
    }
}
for _ in 0..<t {
    let (n, k) = (fIO.readInt(), fIO.readInt())
    var ds = [0]
    for _ in 0..<n {
        ds.append(fIO.readInt())
    }
    var values = Array(repeating: [Int](), count: n + 1)
    var indegrees = Array(repeating: 0, count: n + 1)
    var dp = Array(repeating: 0, count: n + 1)
    for i in 0..<k {
        let (s, e) = (fIO.readInt(), fIO.readInt())
        values[s ].append(e)
        indegrees[e] += 1

    }
    let target = fIO.readInt()
    var queue = Queue()
    for i in 1...n {
        if indegrees[i] == 0 {
            queue.push(i)
            dp[i] = ds[i]
        }
    }
    while !queue.isEmpty {
        let node = queue.pop()
        for next in values[node] {
            indegrees[next] -= 1
            dp[next] = max(dp[next], dp[node] + ds[next])
            if indegrees[next] == 0 {
                queue.push(next)
            }
        }
    }
    print(dp[target])
}
