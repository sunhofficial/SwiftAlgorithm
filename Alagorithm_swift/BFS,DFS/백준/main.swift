// 1470
import Foundation
let n = Int(readLine()!)!
for _ in 0..<n {
    let ve = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var graphs = [[Int]](repeating: [], count: ve[0] + 1)
    for _ in 0..<ve[1] {
        let ab = readLine()!.split(separator: " ").map{ Int(String($0))!}, a = ab[0], b = ab[1]
        graphs[a].append(b)
        graphs[b].append(a)
        
    }
    var visited = Array(repeating: 0, count: ve[0] + 1)
    func bfs(node: Int) -> Bool {
        var queue = [(node,1)]
        var index = 0
        visited[node] = 1
        while queue.count > index {
            let cur = queue[index].0
            let color = queue[index].1
            for nextNode in graphs[cur] {
                if visited[nextNode] == 0 {
                    let nextColor = color == 1 ? -1 : 1
                    visited[nextNode] = nextColor
                    queue.append((nextNode, nextColor))
                    continue
                }
                if visited[nextNode] == color {
                    return false
                }
            }
            index  += 1
        }
        return true
    }
    var answer = true
    for i in 1...ve[0] {
        if visited[i] == 0 && !bfs(node: i) {
            answer = false
            break
        }
    }
    print(answer ? "YES": "NO")
}
