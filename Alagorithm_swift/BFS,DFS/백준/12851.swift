//
//  12851.swift
//  Alogrithm2
//
//  Created by Sunho on 8/18/24.
//

import Foundation
let nk = readLine()!.split(separator: " ").map{Int(String($0))!}

var map = Array(repeating: -1 , count: 100001)
var cnt = 0
var minTime = Int.max

func bfs(_ n: Int ) {
    var queue  = [(n,0)]
    var index = 0
    map[n] = 0
    while index < queue.count {
        let (cur,time) = queue[index]
        index += 1
        if cur == nk[1] {
            if time < minTime {
                minTime = time
                cnt = 1
            } else if time == minTime {
                cnt += 1
            }
            continue
        }
        let next = [cur - 1 ,cur + 1, cur * 2]
        for i in next {
            if i >= 0 && i < 100001 {
                if map[i ] == -1 || map[i ] >= time + 1{
                    map[i ] = time + 1
                    queue.append((i, time + 1))
                }
            }
        }
    }
}
bfs(nk[0])
print(minTime)
print(cnt)
