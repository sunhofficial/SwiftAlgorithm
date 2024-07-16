//
//  최소직사각형.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/16/24.
//

import Foundation


func solution(_ sizes:[[Int]]) -> Int {
    var maxnum = 0
    var minnum = 0
    for size in sizes {
        maxnum = max(size.max()!, maxnum)
        minnum = max(size.min()!, minnum)
    }
     return (maxnum * minnum)

}
