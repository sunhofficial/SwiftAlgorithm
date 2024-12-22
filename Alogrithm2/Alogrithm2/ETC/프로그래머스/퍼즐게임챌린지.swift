import Foundation

func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    var end = diffs.max() ?? 1
    var start = 1
    var result = end
    while start <= end {
        let mid = (end + start) / 2
        var time = 0
        var time_prev = 0
        for (index, diff) in diffs.enumerated() {
            if diff <= mid {
                time += times[index]
            } else {
                time += (times[index] + time_prev) * (diff - mid) + times[index]
            }
            time_prev = times[index]
        }
        if time > limit {
            start = mid + 1
        } else {
            end = mid - 1
            result = mid
        }
    }

    return result
}
