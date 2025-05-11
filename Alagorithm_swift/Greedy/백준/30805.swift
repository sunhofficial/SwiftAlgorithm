//
//  30805.swift
//  Alogrithm2
//
//  Created by Sunho on 3/10/25.
//

import Foundation


func readInput() -> ([Int], [Int]) {
    let n = Int(readLine()!)!
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    let m = Int(readLine()!)!
    let b = readLine()!.split(separator: " ").map { Int($0)! }
    return (a, b)
}

func findLargestCommonSubsequence(_ a: [Int], _ b: [Int]) -> [Int] {
    var a = a
    var b = b
    var result: [Int] = []
    
    while true {
        let common = Set(a).intersection(Set(b))
        if common.isEmpty { break }
        
        if let maxElement = common.max() {
            result.append(maxElement)
            if let aIndex = a.firstIndex(of: maxElement),
               let bIndex = b.firstIndex(of: maxElement) {
                a = Array(a[(aIndex + 1)...])
                b = Array(b[(bIndex + 1)...])
            }
        }
    }
    
    return result
}

func main() {
    let (a, b) = readInput()
    let result = findLargestCommonSubsequence(a, b)
    print(result.count)
    print(result.map { String($0) }.joined(separator: " "))
}

main()
