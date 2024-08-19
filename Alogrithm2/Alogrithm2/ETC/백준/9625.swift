//
//  9625.swift
//  Alogrithm2
//
//  Created by Sunho on 8/19/24.
//

import Foundation
let k = Int(readLine()!)!
func flip(_ n: Int ) -> (Int,Int){
    var cur = (1,0)
    for i in 1...n {
        cur = (cur.1, cur.0 + cur.1)
    }
    return cur
}

print("\(flip(k).0) \(flip(k).1)")
