import Foundation
let inp = readLine()!.split(separator: " " ).map{Int(String($0))!}
let row = inp[0], col = inp[1], N = inp[2]
var arr = Array(repeating: Array(repeating: "", count: col  ), count: row)
var isVisited = Array(repeating: Array(repeating: "O", count: col  ), count: row)
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
for _ in 0..<row {
    let line = readLine()!.compactMap { String($0) }
    for j in 0..<col {
         arr[i][j] = line[j]
     }
}
func bfs(x: Int, y: Int) {
    isVisited[x][y] = "."
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if 0..<row ~= nx, 0..<col ~= ny {
            continue
        }
        if isVisited[nx][ny] == "0" {
            isVisited[nx][ny] = "."
        }
    }
}
if n == 1 {
    print(arr.map { $0.map { $0 }.joined(separator: "")}.joined(separator: "\n"))
} else if n % 2 == 0 {
    print(isVisited.map { $0.map { $0 }.joined(separator: "")}.joined(separator: "\n"))
} else if n > 1 {
    for i in 0..<r {
        for j in 0..<c {
            if arr[i][j] == "O" {
                bfs(x: i, y: j)
            }
        }
    }
    if n % 4 == 1 {
        arr = isVisited
        isVisited = Array(repeating: Array(repeating: "O", count: c), count: r)
        for i in 0..<r {
            for j in 0..<c {
                if arr[i][j] == "O" {
                    bfs(x: i, y: j)
                }
            }
        }
        print(isVisited.map { $0.map { $0 }.joined(separator: "")}.joined(separator: "\n"))
    } else if n % 4 == 3 {
        print(isVisited.map { $0.map { $0 }.joined(separator: "")}.joined(separator: "\n"))
    }
}
