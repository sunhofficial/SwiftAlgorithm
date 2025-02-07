//
//  main.swift
//  Alogrithm2
//
//  Created by Sunho on 2/6/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var arrs = Array(readLine()!.trimmingCharacters(in: .whitespaces).map { $0 }) 
//끝에서부터 왼쪽을보고 집어. 그런데 없어 오른쪽 집어. 그래도 없어 패스? 그러면 그리디 아냐?
// 그리디 방식으로 문제를 해결
var check = [Bool](repeating: false, count: n)
for i in 0..<n {
    if arrs[i] == "P" {
        for j in (i-m)...(i+m) {
            if i == j || j < 0 || j >= n { continue }
            if !check[j] && arrs[j] == "H"{
                check[j] = true
                break
            }
        }
    }
}
// 잡은 부품의 개수 세기
let count = check.filter { $0 }.count

// 결과 출력
print(count)
