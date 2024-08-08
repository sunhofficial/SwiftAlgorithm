import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.sorted()
    var maxTime = times.last! * n
    var minTime = 1
    var result = 0
    while minTime <= maxTime {
        let mid = (minTime + maxTime ) / 2
        var sum = 0
        times.forEach {
            sum += mid / $0
        }
        if sum < n {
            minTime = mid + 1
        } else {
            maxTime = mid - 1
            result = mid
        }
    }
    return Int64(result)
}
