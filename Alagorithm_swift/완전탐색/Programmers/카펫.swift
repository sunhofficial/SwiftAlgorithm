//
//  카페.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/23/24.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    for i in 1...Int(sqrt(Double(yellow))) {
        if yellow % i == 0 && (i + yellow / i ) * 2 + 4 == brown{
            return [yellow / i + 2 , i + 2 ]
        }
    }
    return []
}
