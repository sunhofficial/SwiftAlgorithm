import Foundation

func solution(_ gems:[String]) -> [Int] {
    var setgems = Set(gems)
    var temp = Int.max
    var answer = [0,0]
    var start = 1
    var end = setgems.count
    while start <= gems.count - setgems.count  {
        let setcount = Set(gems[start-1...end-1]).count
        if setcount == setgems.count {
            if temp > end - start {
                answer = [start,end]
                temp = end - start
            }
            start += 1
            end = start + setgems.count
            continue
        } else {
            end += 1
            if end > gems.count {
                start += 1
                end = start + setgems.count
            }
        }
    }
    return answer
}
