//
//  20055.swift
//  Alogrithm2
//
//  Created by Sunho on 1/23/25.
//

import Foundation
let nk = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nk[0] , k = nk[1]
struct Khan {
    var life: Int
    var hasRobot: Bool
}
var convainer = [Khan]()
convainer = readLine()!.split(separator: " ").map{Int(String($0))!}.map{.init(life: $0, hasRobot: false)}
var answer = 0
var zeroBlankCnt = 0
func lotateConvainer() {
    convainer.insert(convainer.removeLast(), at: 0)
}
func countZeroBlank() {
    var cnt = 0
    convainer.forEach {blank in
        if blank.life == 0 {
            cnt += 1
        }
    }
    zeroBlankCnt = cnt
}
while zeroBlankCnt < k {
    answer += 1
    lotateConvainer()
    if convainer[n-1].hasRobot {
        convainer[n-1].hasRobot = false
    }
    for i in stride(from: n-2, through: 0, by: -1) {
        if convainer[i].hasRobot && convainer[i+1].life >= 1 && !convainer[i+1].hasRobot {
            convainer[i+1].life -= 1
            convainer[i].hasRobot = false
            if i == n-2 {
                continue
            }
            convainer[i+1].hasRobot = true
        }
    }
    if convainer[0].life >= 1 && !convainer[0].hasRobot {
        convainer[0].hasRobot = true
        convainer[0].life -= 1
    }
    countZeroBlank()
}
print(answer)
