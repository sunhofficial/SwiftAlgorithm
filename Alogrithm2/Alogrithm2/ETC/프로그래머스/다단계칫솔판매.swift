import Foundation

func solution(_ enroll: [String], _ referral: [String], _ seller: [String], _ amount: [Int]) -> [Int] {
    var trees = [String: String]()  // 추천인 관계를 저장하는 딕셔너리
    var profitsDict = [String: Int]() // 각 인원의 이익을 저장하는 딕셔너리

    for i in 0..<enroll.count {
        trees[enroll[i]] = referral[i]
        profitsDict[enroll[i]] = 0
    }

    func distributeProfits(_ name: String, _ profits: Int) {
        if profits < 1 { return }
        
        let forParent = profits / 10
        let current = profits - forParent
        profitsDict[name]! += current

        if let parent = trees[name], parent != "-" {
            distributeProfits(parent, forParent)
        }
    }

    for i in 0..<seller.count {
        distributeProfits(seller[i], amount[i] * 100)
    }

    return enroll.map { profitsDict[$0]! }
}
