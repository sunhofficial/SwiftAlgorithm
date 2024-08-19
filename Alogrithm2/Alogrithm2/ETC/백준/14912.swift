//
//  14912.swift
//  Alogrithm2
//
//  Created by Sunho on 8/19/24.
//

import Foundation
let nd = readLine()!.split(separator: " ").map{Int(String($0))!}
var cnt = 0
for i in 1...nd[0] {
    cnt  += String(i).compactMap {Int(String($0))}.filter{$0 == nd[1]}.count
}
print(cnt)
