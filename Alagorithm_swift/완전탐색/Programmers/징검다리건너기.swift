import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var left = 1
    var right = 200000000
    while left<right {
        let mid = (left + right ) / 2
        var cnt = 0
        for i in 0..<stones.count {
            if stones[i] <= mid {
              cnt += 1
                if cnt >= k {
                    break
                }
            } else {
                cnt = 0
            }
        }
        if cnt >= k {
            right = mid
        } else {
            left = mid + 1
        }
    }
    return left
}
