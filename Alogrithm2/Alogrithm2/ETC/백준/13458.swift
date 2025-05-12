//
//  13458.swift
//  Alogrithm2
//
//  Created by Sunho on 5/11/25.
//

import Foundation
let n = Int(readLine()!)!
var ais = readLine()!.split(separator: " ").map{Int(String($0))!}
let bc = readLine()!.split(separator: " ").map{Int(String($0))!}, b = bc[0], c = bc[1]
print(ais.map{$0 - b}.filter{$0 > 0}.map{$0 % c == 0 ? $0 / c : $0 / c + 1}.reduce(n, +))
