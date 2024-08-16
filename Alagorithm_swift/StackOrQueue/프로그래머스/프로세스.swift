import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var p = priorities
    var targetIdx = location
    while true {
        if p.contains(where: {$0 > p[0]}) {
            p.append(p[0])
            p.removeFirst()
            targetIdx = (targetIdx - 1 < 0) ? (p.count - 1) : (targetIdx - 1)
        } else {
            if targetIdx == 0 {
                return priorities.count - p.count + 1
            }
            p.removeFirst()
            targetIdx  -= 1
        }
    }
}
