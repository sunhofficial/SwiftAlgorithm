import Foundation

// Jolly Jumper를 확인하는 함수
func isJolly(_ arr: [Int]) -> Bool {
    let n = arr.count
    if n == 1 {
        return true
    }
    
    var differences = Set<Int>()
    
    for i in 1..<n {
        let diff = abs(arr[i] - arr[i - 1])
        if diff == 0 || diff >= n || differences.contains(diff) {
            return false
        }
        differences.insert(diff)
    }
    
    return differences.count == n - 1
}

while let line = readLine() {
    let numbers = line.split(separator: " ").map { Int($0)! }
    let sequence = Array(numbers.dropFirst())
    
    if isJolly(sequence) {
        print("Jolly")
    } else {
        print("Not jolly")
    }
}
