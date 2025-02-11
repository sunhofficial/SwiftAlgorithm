//15681
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], r = input[1], q = input[2]
var edges = [[Int]](repeating: [], count: n + 1)
for _ in 0..<n - 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0], v = input[1]
    edges[u].append(v)
    edges[v].append(u)
}
var dp  = [Int](repeating: 0, count: n + 1)
func dfs(node: Int) {
    dp[node] = 1
    for nextnode in edges[node] {
        if dp[nextnode ] == 0 {
            dfs(node: nextnode)
            dp[node] += dp[nextnode]
        }
    }
}
dfs(node: r)

var answer = ""
for _ in 0..<q {
    let node = Int(readLine()!)!
    answer += "\(dp[node])\n"
}
print(answer)
