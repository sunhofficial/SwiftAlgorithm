import Foundation

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nmk[0], m = nmk[1], k = nmk[2]

var maps = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)
var visited = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)

// 입력받은 직사각형을 맵에 기록
for _ in 0..<k {
    let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let r = rc[0]
    let c = rc[1]
    maps[r][c] = true
}

// DFS 탐색을 위한 이동 방향
var dr = [1, -1, 0, 0]
var dc = [0, 0, 1, -1]

// DFS 함수 정의
func dfs(_ r: Int, _ c: Int) -> Int {
    visited[r][c] = true
    var cnt = 1
    for i in 0..<4 {
        let nr = r + dr[i]
        let nc = c + dc[i]
        if isValid(nr, nc) && maps[nr][nc] && !visited[nr][nc] {
            cnt += dfs(nr, nc)
        }
    }
    return cnt
}

// 좌표가 맵의 범위 내에 있는지 확인하는 함수
func isValid(_ r: Int, _ c: Int) -> Bool {
    return r >= 1 && r <= n && c >= 1 && c <= m
}

// 최대 영역 크기를 저장할 변수
var maxArea = 0

// 모든 좌표를 돌면서 DFS 탐색을 수행
for r in 1...n {
    for c in 1...m {
        if maps[r][c] && !visited[r][c] {
            maxArea = max(maxArea, dfs(r, c))
        }
    }
}

// 결과 출력
print(maxArea)
