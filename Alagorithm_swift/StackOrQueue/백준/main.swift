//
//  10799.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/5/24.
//

import Foundation
let inputs = readLine()!.map{String($0)}
var cnt = 0
var index = 0
var bars = 0
while index < inputs.count {
    if inputs[index] == "(" && index + 1 < inputs.count  {
        if inputs[index + 1] == ")" {
            cnt += bars
            index += 2
        } else {
            bars += 1
            index += 1
        }
    }
    else if inputs[index] == ")" {
        index += 1
        cnt += 1
        bars -= 1
    }
}
print(cnt)
