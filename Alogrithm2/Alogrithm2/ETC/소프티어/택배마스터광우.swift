//
//  main.swift
//  Alogrithm2
//
//  Created by Sunho on 2/7/25.
//

import Foundation
let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nmk[0], m = nmk[1], k = nmk[2]
var arrs = readLine()!.split(separator: " ").map{Int(String($0))!}



func permutation<T>(_ arrs: [T]) -> [[T]] {
    var result = [[T]]()
    var check = [Bool](repeating: false, count: arrs.count)
    func permute(_ arr: [T]) {
        if arr.count == arrs.count {
            result.append(arr)
            return
        }
        for i in 0..<arrs.count {
            if check[i] == true {
                continue
            } else {
                check[i] = true
                permute(arr + [arrs[i]])
                check[i] = false
            }
        }
    }
    permute([])
    return result
}
let permuteResult = permutation(arrs)
func slidingWindow(_ arr: [Int]) -> Int {
    var sum = 0
    var work = 0
    var ans = 0
    var index = 0
    
    while work < k {
        if sum + arr[index] > m {
            ans += sum
            sum = 0
            work += 1
        }
        sum += arr[index]
        index = (index + 1 ) % n
    }
    return ans
}
var answer = Int.max
for i in permuteResult {
    answer = min(answer, slidingWindow(i))
}
print(answer)
