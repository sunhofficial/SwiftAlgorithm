import Foundation

func solution(_ gems:[String]) -> [Int] {
//    var setgems = Set(gems)
//    var temp = Int.max
//    var answer = [0,0]
//    var start = 1
//    var end = setgems.count
//    while start <= gems.count - setgems.count  {
//        let setcount = Set(gems[start-1...end-1]).count
//        if setcount == setgems.count {
//            if temp > end - start {
//                answer = [start,end]
//                temp = end - start
//            }
//            start += 1
//            end = start + setgems.count
//            continue
//        } else {
//            end += 1
//            if end > gems.count {
//                start += 1
//                end = start + setgems.count
//            }
//        }
//    }
//    return answer
    var setgems = Set(gems)
    var gemDict = [String: Int]()
    var start = 0
    var end = 0
    var answer = [1,gems.count]
    let totalCount = setgems.count
    var minLenth = Int.max
    while end < gems.count {
        gemDict[gems[end],default:  0] += 1
    
        while gemDict.count == totalCount {
            if end - start < minLenth {
                minLenth = end - start
                answer = [start+1, end+1]
                if minLenth + 1 == totalCount { break}
            }
            gemDict[gems[start]]! -= 1
            if gemDict[gems[start]] == 0 {
                gemDict[gems[start]]  = nil
            }
            start += 1
        }
        end += 1
    }
    return answer
    
}
