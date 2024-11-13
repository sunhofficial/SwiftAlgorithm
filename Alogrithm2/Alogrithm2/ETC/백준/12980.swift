//
//  testC.swift
//  Alogrithm2
//
//  Created by Sunho on 11/10/24.
//

import Foundation
let ns = readLine()!.split(separator: " ").map{Int(String($0))!}, n = ns[0], s = ns[1]
let arrs = readLine()!.split(separator: " ").map{Int(String($0))!}

func countPermutationsWithScore(n: Int, s: Int, initialArray: [Int]) -> Int {
    var possibleValues = Set(1...n)
    var zeroinDices = [Int]()
    for value in initialArray where value != 0 {
        possibleValues.remove(value)
    }
    for (index, value ) in initialArray.enumerated() where value == 0 {
        zeroinDices.append(index)
    }
    let possibleArray = Array(possibleValues)

    var cnt = 0
    func calculateScore(_ array: [Int]) -> Int {
        var score = 0
        for i in 0..<array.count {
            for j in (i+1)..<array.count {
                if array[i] < array[j] {
                    score += 1
                }
            }
        }
        return score
    }
    // 0인 곳에 하나씩 채워보자.
    func backTracking(_ index: Int, _ currentAraay: [Int], _ usedNums: Set<Int>) {
        if index == zeroinDices.count {
            if calculateScore(currentAraay) == s {
                cnt += 1
            }
            return
        }
        let position = zeroinDices[index]
        for value in possibleArray {
            if usedNums.contains(value){
                continue
            }
            var newArr = currentAraay
            newArr[position] = value
            var newUsedNums  = usedNums
            newUsedNums.insert(value)
            backTracking(index + 1 , newArr, newUsedNums)
        }
    }
    let initialUsedNumbers = Set(initialArray.filter { $0 != 0 })
    backTracking(0, initialArray,initialUsedNumbers)
    return cnt
}
print(countPermutationsWithScore(n: n, s: s, initialArray: arrs))
