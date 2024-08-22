import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let sortedCosts = costs.sorted{$0[2] < $1[2]}
    var parents = Array(0..<n)
    var sum = 0
    func getParent(_ num: Int) -> Int {
    if parents[num] == num{
        return num
    }
        return getParent(parents[num])
}
    func unionFind(_ node1: Int, _ node2: Int)  {
        let parent1 = getParent(node1)
        let parent2 = getParent(node2)
        if parent1 < parent2 {
            parents[parent2] = parent1
        } else {
            parents[parent1] = parent2
        }
    }
    for cost in sortedCosts {
        let node1 = cost[0]
        let node2 = cost[1]
        let costs = cost[2]
        if getParent(node1) != getParent(node2) {
            unionFind(node1,node2)
            sum += costs
        }
    }
    return sum
}

