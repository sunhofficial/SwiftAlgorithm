//
//  타겟넘버.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/4/24.
//
import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {

    func dfs(index: Int, sum: Int)  -> Int {
        if index == numbers.count {
            return sum == target ? 1 : 0
        }
        return dfs(index: index+1, sum: sum + numbers[index]) + dfs(index: index+1, sum: sum - numbers[index])
    }
    return dfs(index: 0, sum: 0)
}
//2트: 아직 재귀가 어렵다. 재귀에서 어떻게 저 return을 통해 1이나 0을 더하는 생각을 했을까 많이 풀어야겟다 dfs, bfs위주로
