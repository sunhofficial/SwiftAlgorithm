import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var answer = [String]()
    var visited = Array(repeating: false, count: tickets.count)
    let tickets = tickets.sorted {$0[1] < $1[1]}
    func dfs(name: String) {
        if tickets.count == answer.count {
            answer.append(name)
            return
        }
        for i in 0..<tickets.count  {
            let start = tickets[i][0]
            let end = tickets[i][1]
            if name == start, !visited[i] {
                visited[i] = true
                answer.append(start)
                dfs(name: end)
                if tickets.count + 1 == answer.count {
                    return
                }
                visited[i] = false
                answer.removeLast()
            }
        }
    }
    dfs(name: "ICN")
    return answer
}
