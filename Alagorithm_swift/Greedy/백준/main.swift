//
//  1744.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/8/24.
//

import Foundation
//let n = Int(readLine()!)!
//var arrs = [Int]()
//for _ in 0..<n {
//    arrs.append(Int(readLine()!)!)
//}
//arrs.sort()
//var index = arrs.count - 1
//var sum = 0
//if arrs.count == 1 {
//    print(arrs[0])
//}else {
//    while index > 0 {
//        if arrs[index] * arrs[index - 1] >= arrs[index] + arrs[index - 1] {
//            sum += arrs[index] * arrs[index - 1]
//            index -= 2
//        } else {
//            if index == 1 {
//                sum += (arrs[index] + arrs[index - 1])
//
//            }
//            else {
//                sum += arrs[index]
//               }
//            index -= 1
//        }
//    }
//    print(sum)
//}
//풀이의 잘못된점 -인 경우 왼쪽에서부터 곱해주는게 이득이고 0은 음수와 곱해주는게 ㄱㅇㄷ->배열을 따로 받아야함 1인경우는 곱하는것보다 더하는게 이득이다.
var plus = [Int]()
var minus = [Int]()
var result = 0
for _ in 0..<Int(readLine()!)! {
    let input = Int(readLine()!)!
    if input > 1 {plus.append(input)}
    else if input == 1 {result += 1}
    else {minus.append(input)}
}
plus.sort(by: >)
minus.sort(by: <)
if plus.count % 2 == 1 {
    result += plus.removeLast()
}
if minus.count % 2 == 1 {
    result += minus.removeLast()
}
while plus.count > 0 || minus.count > 0 {
    if plus.count > 0 {result += plus.removeLast() * plus.removeLast()}
    if minus.count > 0 { result += minus.removeLast() * minus.removeLast()}
}
print(result)
