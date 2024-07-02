import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var setLost = Set(lost)
    var setReserve = Set(reserve)

    // 여벌이 있지만 도난당한 학생 제거
    let intersection = setLost.intersection(setReserve)
    setLost.subtract(intersection)
    setReserve.subtract(intersection)

    // 여벌 체육복을 나눠줌
    for i in setReserve.sorted() {
        if setLost.contains(i - 1) {
            setLost.remove(i - 1)
        } else if setLost.contains(i + 1) {
            setLost.remove(i + 1)
        }
    }

    return n - setLost.count
}
