//
//  1647.swift
//  Alogrithm2
//
//  Created by Sunho on 1/31/25.
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
let file = FileIO()


let n = file.readInt()
let m = file.readInt()
var maps = [[Int]]()
for _ in 0..<m {
    let a = file.readInt()
       let b = file.readInt()
       let c = file.readInt()
   maps.append([a,b,c])
}
maps.sort{ $0[2] < $1[2]}
var parent = Array(0...n)
func findParent(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = findParent(parent[x])  // 경로 압축 적용
    }
    return parent[x]
}
var costs = 0
var maxEdge = 0
func union(_ a: Int, _ b: Int) {
    let aparent = findParent(a)
    let bparent = findParent(b)
    parent[bparent] = aparent
}
for node in maps {
    let px = findParent(node[0]),  py = findParent(node[1])
    
    if px != py {
        union(node[0], node[1])
        costs += node[2]
        maxEdge = node[2]
    }
}
print(costs - maxEdge)

