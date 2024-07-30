import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer = [Int]()
    var lastdate = 0
    for i in 0..<progresses.count {
        let day = Int(ceil((100-Double(progresses[i])) / Double(speeds[i])))
        if day > lastdate {
            lastdate = day
            answer.append(1)
        } else {
            answer[answer.count - 1] += 1
}

    }
    return answer
}
