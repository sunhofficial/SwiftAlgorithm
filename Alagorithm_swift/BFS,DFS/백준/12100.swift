//
//  12100.swift

import Foundation
enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
}
let n = Int(readLine()!)!
var board = [[Int]]()
var maxBlock = 0

for _ in 0..<n {
    let inputLine = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(inputLine)
}

func dfs(board: [[Int]], depth: Int) {
    if depth == 5 {
        let tempMax = board.flatMap {$0}.max() ?? 0
        maxBlock = max(maxBlock, tempMax)
        return
    }
    for dir in Direction.allCases {
        var newboard = board
        newboard = move(direction: dir, board: newboard)
        dfs(board: newboard, depth: depth + 1)
    }
}
dfs(board: board, depth: 0)
print(maxBlock)
func move(direction: Direction, board: [[Int]]) -> [[Int]] {
    var newBoard = board
    let n = board.count
    switch direction {
    case .up:
        for j in 0..<n {
            var index = 0
            var merged = [Bool](repeating: false, count: n)
            for i in 1..<n {
                if newBoard[i][j] == 0 {
                    continue
                }
                var ni = i
                while ni > index && newBoard[ni-1][j] == 0 {
                    ni -= 1
                }
                if ni > 0 && newBoard[ni-1][j] == newBoard[i][j] && !merged[ni-1] {
                    newBoard[ni-1][j] *= 2
                    newBoard[i][j] = 0
                    merged[ni-1]  = true
                } else {
                    if ni != i {
                        newBoard[ni][j] = newBoard[i][j]
                        newBoard[i][j] = 0
                    }
                    index = ni + 1
                }
            }
        }
    case .down:
        for j in 0..<n {
            var index = n - 1
            var merged = [Bool](repeating: false, count: n)
            for i in (0..<n-1).reversed() {
                if newBoard[i][j] == 0 {continue}
                var ni = i
                while ni < index && newBoard[ni+1][j] == 0 {ni += 1}
                if ni < n-1 && newBoard[ni+1][j] == newBoard[i][j] && !merged[ni+1] {
                    newBoard[ni+1][j] *= 2
                    newBoard[i][j] = 0
                    merged[ni+1] = true
                } else {
                    if ni != i {
                        newBoard[ni][j] = newBoard[i][j]
                        newBoard[i][j] = 0
                    }
                    index = ni - 1
                }
            }
        }
    case .left:
        for i in 0..<n {
            var index = 0
            var merged = [Bool](repeating: false, count: n)
            for j in 1..<n {
                if newBoard[i][j] == 0 {continue}
                var nj = j
                while nj > index && newBoard[i][nj-1] == 0 {
                    nj -= 1
                }
                if nj > 0 && newBoard[i][nj-1] == newBoard[i][j] && !merged[nj-1] {
                    newBoard[i][nj-1] *= 2
                    newBoard[i][j] = 0
                    merged[nj-1] = true
                } else {
                    if nj != j {
                        newBoard[i][nj] = newBoard[i][j]
                        newBoard[i][j] = 0
                    }
                    index = nj + 1
                }
            }
        }
    case .right:
        for i in 0..<n {
            var index = n - 1
            var merged = [Bool](repeating: false, count: n)
            for j in (0..<n-1).reversed() {
                if newBoard[i][j] == 0 {continue}
                var nj = j
                while nj < index && newBoard[i][nj+1] == 0 {
                    nj += 1
                }
                if nj < n-1 && newBoard[i][nj+1] == newBoard[i][j] && !merged[nj+1] {
                    newBoard[i][nj+1] *= 2
                    newBoard[i][j] = 0
                    merged[nj+1] = true
                } else {
                    if nj != j {
                        newBoard[i][nj] = newBoard[i][j]
                        newBoard[i][j] = 0
                        
                    }
                    index = nj - 1
                }
            }
        }
    }
    return newBoard
}
