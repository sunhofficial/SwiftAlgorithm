//10451
let t = Int(readLine()!)!
for i in 0..<t {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var line = Array(repeating: 0, count: n+1)
    var visited = Array(repeating: false, count: n+1)
    var answer = 0
    for i in 0..<n {
        line[i+1] = nums[i]
    }
    func dfs(_ start: Int) {
        var index = 0
        var queue = [start]
        while queue.count > index {
            let current = queue[index]
            index += 1
            if !visited[current] {
                visited[current] = true
                queue.append(line[current])
            }}
        }
        for i in 1...n {
            if !visited[i] {
                dfs(i)
                answer += 1
            }
        }
        print(answer)
    }
    
