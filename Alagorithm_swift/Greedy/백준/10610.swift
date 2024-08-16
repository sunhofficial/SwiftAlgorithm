//
//  10610.swift
//  Alogrithm2
//
//  Created by Sunho on 8/16/24.
//

import Foundation
let n = Array(readLine()!).sorted(by: >)
let sum = n.reduce(0, {$0 + Int(String($1))!})
if n.last! != Character("0") || sum % 3 != 0 {
    print("-1")
} else {
    print(String(n))
}
