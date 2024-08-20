var maps = Array(repeating: (0, 0), count: 100)
let nm = readLine()!.split(separator: " ").map { Int($0)! }

for i in 0..<nm[1] {
    let ij = readLine()!.split(separator: " ").map { Int($0)! }
    maps[i] = (ij[0], ij[1])
}

func calc(mask: Int) -> Bool {
    for m in 0..<nm[1] {
        let i = maps[m].0
        let j = maps[m].1

        // i와 j가 양수인 경우에 대해서만 abs(i - 1) 또는 abs(j - 1)을 사용
        var x = (mask & (1 << (abs(i) - 1))) != 0
        var y = (mask & (1 << (abs(j) - 1))) != 0
        
        // i나 j가 음수인 경우, x와 y를 반전시킴
        if i < 0 { x = !x }
        if j < 0 { y = !y }
        
        // 모든 경우가 true가 되어야 하므로, 하나라도 false면 실패
        if !(x || y) {
            return false
        }
    }
    return true
}

func bruteForce() -> Int {
    for i in 0..<(1 << nm[0]) {
        if calc(mask: i) {
            return 1
        }
    }
    return 0
}

print(bruteForce())
