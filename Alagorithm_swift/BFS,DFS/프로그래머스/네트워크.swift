import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var cnt = 0
    func dfs(i: Int) {
        visited[i]  = true
        for (j, val) in computers[i].enumerated() {
            if val == 1 && j != i && visited[j] == false {
                visited[j] = true
                cnt += 1
                dfs(i: j)
            }
        }

    }
    for i in 0..<n {
        if !visited[i] {
            dfs(i: i)
        }

    }

    return n -  cnt
}
