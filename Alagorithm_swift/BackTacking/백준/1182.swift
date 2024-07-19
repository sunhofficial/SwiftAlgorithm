import Foundation

let ns = readLine()!.split(separator: " ").map { Int(String($0))! }
let arrr = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = ns[0]
let s = ns[1]
var cnt = 0

func dfs(index: Int, currentSum: Int) {
    // 부분수열의 합이 S가 되면 카운트 증가
    if index >= n {
        return
    }

    // 현재 요소를 포함하는 경우
    if currentSum + arrr[index] == s {
        cnt += 1
    }

    // 다음 요소를 포함하지 않는 경우
    dfs(index: index + 1, currentSum: currentSum)

    // 다음 요소를 포함하는 경우
    dfs(index: index + 1, currentSum: currentSum + arrr[index])
}

// 초기 호출
dfs(index: 0, currentSum: 0)

// 결과 출력
print(cnt)
