//
//  올바른괄호.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/3/24.
//

import Foundation

func solution(_ s:String) -> Bool
{
    var cnt = 0
    for val in s {
        if val == "(" {
            cnt += 1
        }else { cnt -= 1}
        if cnt < 0 { return false}
    }
    if cnt == 0 {
        return true
    } else { return false}
}
