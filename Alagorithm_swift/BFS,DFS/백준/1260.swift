import Foundation
let nmv = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nmv[0], m = nmv[1], v = nmv[2]
var graph : [[Int]] = Array(repeating: [], count: n+1)
var visited = Array(repeating: false, count: n + 1)
for i in 0..<m {
    let relation = readLine()!.split(separator: " ").map{Int(String($0))!}
       let a = relation[0]
       let b = relation[1]
       graph[a].append(b)
       graph[b].append(a)
}

func dfs(node: Int) {
    visited[node] = true
    print(node, terminator: " ")
    for nextnode in graph[node] {
        if !visited[nextnode] {
            dfs(node: nextnode)
        }
    }
    
}

func bfs(node: Int) {
    var queue = [node]
    var idx = 0
    visited[node] = true
    while queue.count > idx {
        let currentNode = queue[idx]
        print(currentNode, terminator: " ")
        for nextNode in graph[currentNode] {
            if !visited[nextNode ] {
                visited[nextNode] = true
                queue.append(nextNode)
            }
        }
        idx += 1
    }
}
dfs(node: v)
visited = [Bool](repeating: false, count: n + 1)
print()
bfs(node: v)
