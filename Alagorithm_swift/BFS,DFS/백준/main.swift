import Foundation

let dx = [1, -1, 0, 0, 0, 0]
let dy = [0, 0, 1, -1, 0, 0]
let dz = [0, 0, 0, 0, 1, -1]

struct Node {
    let x: Int
    let y: Int
    let z: Int
    let time: Int
}

func bfs(_ building: [[[Character]]], _ start: Node, _ end: Node, _ L: Int, _ R: Int, _ C: Int) -> Int {
    var queue = [start]
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: C), count: R), count: L)
    visited[start.z][start.y][start.x] = true  // 시작점 방문 처리

    var index = 0
    while index < queue.count {
        let current = queue[index]
        index += 1

        if current.x == end.x, current.y == end.y, current.z == end.z {
            return current.time
        }

        for i in 0..<6 {
            let nx = current.x + dx[i]
            let ny = current.y + dy[i]
            let nz = current.z + dz[i]

            if 0..<C ~= nx && 0..<R ~= ny && 0..<L ~= nz, !visited[nz][ny][nx], building[nz][ny][nx] != "#" {
                visited[nz][ny][nx] = true
                queue.append(Node(x: nx, y: ny, z: nz, time: current.time + 1))
            }
        }
    }
    return -1
}

while let firstline = readLine(), firstline != "0 0 0" {
    let lrc = firstline.split(separator: " ").map { Int(String($0))! }
    let (L, R, C) = (lrc[0], lrc[1], lrc[2])

    var building = [[[Character]]](repeating: [[Character]](repeating: [Character](repeating: ".", count: C), count: R), count: L)
    var start = Node(x: 0, y: 0, z: 0, time: 0)
    var end = Node(x: 0, y: 0, z: 0, time: 0)

    for k in 0..<L {
        for t in 0..<R {
            let row = Array(readLine()!)
            building[k][t] = row
            for p in 0..<C {
                if row[p] == "S" {
                    start = Node(x: p, y: t, z: k, time: 0)  // x=열(C), y=행(R), z=층(L)
                } else if row[p] == "E" {
                    end = Node(x: p, y: t, z: k, time: 0)
                }
            }
        }
        _ = readLine() // 층과 층 사이의 빈 줄 처리
    }

    let result = bfs(building, start, end, L, R, C)
    print(result == -1 ? "Trapped!" : "Escaped in \(result) minute(s).")
}
