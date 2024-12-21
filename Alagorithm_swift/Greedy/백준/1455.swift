import Foundation

// N과 M 입력 받기
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let N = nm[0]
let M = nm[1]

// 보드 입력 받기
var board = [[Int]]()
for _ in 0..<N {
    let row = Array(readLine()!).map { Int(String($0))! }
    board.append(row)
}

// 뒤집기 함수
func flip(R: Int, C: Int) {
    for r in 0...R {
        for c in 0...C {
            // 방법 1
            board[r][c] = board[r][c] == 1 ? 0 : 1
        }
    }
}

// 뒤집기 횟수 세기
var count = 0
for n in (0..<N).reversed() {
    for m in (0..<M).reversed() {
        if board[n][m] == 1 {
            count += 1
            flip(R: n, C: m)
        }
    }
}

// 결과 출력
print(count)
