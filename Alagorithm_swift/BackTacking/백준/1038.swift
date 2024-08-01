import Foundation
let n = Int(readLine()!)!
//let lists = [0,1,2,3,4,5,6,7,8,9]
//var cnt = 0
//var answer = [0]
//func dfs(_ arr: [Int]) {
//    if !arr.isEmpty {
//        answer.append(Int(arr.reduce("", {$0 + String($1)}))!)
//    }
//    for num in lists{
//        if arr.isEmpty{
//            if num != 0 {
//                cnt += 1
//                dfs([num])
//            }
//        } else {
//            if arr.last! > num {
//                cnt += 1
//                dfs(arr + [num])
//            }
//        }
//    }
//}
//dfs([])
var answer = [Int]()
func check(_ index: Int, _ value: [Int]) {
    for i in stride(from: index - 1 , to: -1, by: -1) {
        check(i, value + [i])
        answer.append((value + [i]).reduce(0, {$0 * 10 + $1}))
    }
}
check(10,[])
answer.sort()
if answer.count <= n {print(-1)}
else {print(answer[n])}
