//
//  상담원인원.swift
//  Alogrithm2
//
//  Created by Sunho on 11/12/24.
//
import Foundation


func solution(_ k:Int, _ n:Int, _ reqs:[[Int]]) -> Int {

    var timeTables = Array(repeating: [(Int,Int)](),count: k + 1 )
    for req in reqs {
        timeTables[req[2]].append((req[0],req[1]))
    }
    let permutations = permutationSum(k: k, targetSum: n)
    var minTime = Int.max
    for temp in permutations {
        let waitTime = calculateTotalWaitingTime(timeTables: timeTables, distribution: temp)
        minTime = min(minTime, waitTime)
    }

    return minTime
}
func calculateTotalWaitingTime(timeTables: [[(Int, Int)]], distribution: [Int]) -> Int {
    var totalTimes = 0
     for (index, mentors) in distribution.enumerated() {
         let type = index + 1
         var waitQueue = [Int]()
         for (startTime , duration) in timeTables[type] {
             waitQueue = waitQueue.filter { $0 > startTime }
             if waitQueue.count < mentors {
                // 멘토가 여유가 있는 경우 즉시 상담
                waitQueue.append(startTime + duration)
            } else {
                // 멘토가 모두 바쁜 경우, 대기 시간을 추가하고 상담을 시작
                let earliestFinishTime = waitQueue.removeFirst()
                totalTimes += earliestFinishTime - startTime
                waitQueue.append(earliestFinishTime + duration)
            }
            waitQueue.sort() // 최솟값을 빠르게 찾기 위해 정렬
         }
     }
    return totalTimes
}
func permutationSum(k: Int, targetSum: Int) -> [[Int]] {
    var result = [[Int]]()
    func permute(current: [Int]) {
        // current 배열의 크기가 k가 되고, 합이 targetSum일 때 결과에 추가
        if current.count == k {
            if current.reduce(0, +) == targetSum {
                result.append(current)
            }
            return
        }

        // 숫자를 추가하여 다음 순열로 넘어가기
        for num in 1...targetSum {
            permute(current: current + [num])
        }
    }

    permute(current: [])
    return result
}
