import Foundation
struct Heap<T> {
    private var heap = [T]()
    let comparer : (T,T) -> Bool
    init( comparer: @escaping (T, T) -> Bool) {

        self.comparer = comparer
    }
    var isEmpty: Bool {
        return heap.isEmpty
    }
    mutating func insert(_ n : T) {
        heap.append(n)
        var cur = heap.count - 1
        while cur != 0 {
            if comparer(heap[cur], heap[(cur-1) / 2]) {
                heap.swapAt(cur, (cur-1)/2)
            } else {break}
            cur = (cur - 1) / 2
        }
    }
    
    mutating func pop() -> T? {
        if isEmpty {
            return nil
        }
        let temp = heap[0]
        if heap.count > 1 {
            heap[0] = heap.popLast()!
        } else {
            heap.removeLast()
        }
        var cur = 0
        while true {
            if cur*2+1 >= heap.count {
                break
            } else if cur*2+2>=heap.count {
                if comparer(heap[cur*2+1],heap[cur]) {
                    heap.swapAt(cur*2+1, cur)
                }
                break
            } else {
                let left = heap[cur*2+1]
                let right = heap[cur*2+2]
                if comparer(left,right) {
                    if comparer(heap[cur],left) {
                        break
                    } else {
                        heap.swapAt(cur, cur*2+1)
                        cur = cur*2+1
                    }
                } else {
                    if comparer(heap[cur],right) {
                        break
                    } else {
                        heap.swapAt(cur , cur*2+2)
                        cur = cur*2+2
                    }
                }
            }
        }
        return temp
    }
}
let ne = readLine()!.split(separator: " ").map{Int(String($0))!}, n = ne[0], e = ne[1]
var graph: [[(Int,Int )]] = .init(repeating: [], count: n+1)
for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!},a = abc[0], b = abc[1], c = abc[2]
    graph[a].append((b,c))
    graph[b].append((a,c))
}
let v12 = readLine()!.split(separator: " ").map{Int(String($0))!}, v1 = v12[0], v2 = v12[1]
var heap = Heap<(Int, Int)>(comparer: {$0.0 < $1.1})
var dist = [Int]()
func find(n:Int) {
    dist = [Int](repeating: 987654321, count: n+1)
    dist[n] = 0
    heap.insert((n,0))
    while let pop = heap.pop() {
        for near in graph[pop.0] {
            let newdist = pop.1 + near.1
            if newdist < dist[near.0] {
                dist[near.0] = newdist
                heap.insert((near.0, newdist))
            }
        }
    }
}
find(n: 1)
let node1Distance = distance[node1]
let node2Distance = distance[node2]

find(n: node2)
let twoEndDistance = distance[n]
let twoOneDistance = distance[node1]

find(n: node1)
let oneEndDistance = distance[n]
let oneTwoDistance = distance[node2]

let minDistance = min(node1Distance + oneTwoDistance + twoEndDistance, node2Distance + twoOneDistance + oneEndDistance)
print(minDistance >= 987654321 ? -1 : minDistance)
