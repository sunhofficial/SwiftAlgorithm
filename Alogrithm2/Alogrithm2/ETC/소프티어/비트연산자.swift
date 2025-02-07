// 최대 2개만 달라야 ㅣㄴ밀감
//비트연산자
import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}

var cnt = 0
var dict = [Int: Int]()
for i in 0..<nm[0] {
    let value = Int(readLine()!,radix: 2)!
    cnt += dict[value, default: 0]
    for similar in hammingDistance(value, nm[1]) {
        cnt += dict[similar, default: 0]
    }
    dict[value,default: 0] += 1
}
//그러면 여기서 2명 조합을 뽑아서 나열해. 그리고 그걸 비트연산자 하면 되려나?
func hammingDistance(_ a: Int, _ M: Int) -> [Int] {
    var result = [Int]()
    for i in 0..<M {
        let bit1 = a ^ (1 << i)
        result.append(bit1)
        for j in (i+1)..<M {
            let bit2 = bit1 ^ (1 << j)
            result.append(bit2)
        }
    }
    return result
}



print(cnt)

