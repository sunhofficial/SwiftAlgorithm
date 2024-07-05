//
//  4963.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/5/24.
//

import Foundation
let dx = [-1,1, 0, 0, -1, 1, -1, 1]
let dy = [-0, 0, -1, 1, -1, -1, 1, 1]
while true {
    let wh = readLine()!.split(separator: " ").map {Int(String($0))!}, w = wh[0], h = wh[1]
    if w == 0 && h == 0 {
        break
    }
    var wholeMap = [[Int]]()

    for _ in 0..<h{
        wholeMap.append(readLine()!.split(separator: " ").map {Int(String($0))!})
    }
    func dfs(x: Int, y: Int) {
        if 0..<h ~= x && 0..<w ~= y {
            if wholeMap[x][y] == 1 {
                wholeMap[x][y] = 0
                for i in 0 ..< 8 {
                    dfs(x: x + dx[i], y: y + dy[i])
                }
            }
        }

    }
    var result = 0
    for i in 0 ..< h {
        for j in 0 ..< w {
            if wholeMap[i][j] == 1 {
                result  += 1
                dfs(x: i, y: j)
            }
        }
    }
    print(result)
}
// 남의 코드보면서 배운점 ~=을 통해 속하는지를 체크해줄수 있다.


