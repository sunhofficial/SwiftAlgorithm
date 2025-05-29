import Foundation
let nl = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nl[0], l = nl[1]
var board = [[Int]]()

// board 입력 받기
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(row)
}

func check(road: [Int]) -> Bool {
    var used = Array(repeating: false, count: n)
    
    for i in 0..<n-1 {
        if road[i] == road[i+1] {
            continue
        }
        
        if abs(road[i] - road[i+1]) != 1 {
            return false
        }
        
        if road[i] > road[i+1] { // 내리막
            // 낮은 쪽에 경사로 설치
            for j in i+1..<i+1+l {
                if j >= n || road[j] != road[i+1] || used[j] {
                    return false
                }
                used[j] = true
            }
        } else { // 오르막
            // 높은 쪽(현재)에 경사로 설치
            for j in i-l+1...i {
                if j < 0 || road[j] != road[i] || used[j] {
                    return false
                }
                used[j] = true
            }
        }
    }
    return true
}

var cnt = 0
for i in 0..<n {
    let row = board[i]
    let col = (0..<n).map{board[$0][i]}
    
    if check(road: row) { cnt += 1 }
    if check(road: col) { cnt += 1 }
}
print(cnt)
