import Foundation

func solution(_ name:String) -> Int {
    let upAlphas = ["Z","Y","X","W","V","U","T","S","R","Q","P","O"]
    let alphabets = ["B","C","D","E","F","G","H","I","J","K","L","M","N"]
    var charDict: [Character: Int] = [:]
    for (index, char) in upAlphas.enumerated() {
        charDict[Character(char)] = index + 1
    }
    for (index, char ) in alphabets.enumerated() {
        charDict[Character(char)] = index + 1
    }
    var sum = 0
    for i in name {
        if let index = charDict[i] {
            sum += index
        }

    }
    var leftright = name.count - 1
    var nameArr = Array(name)
    // A일때 돌아가는 처리를 어떻게 해야할까?
    for i in 0 ..< name.count {
        var endIndex = i + 1
        while endIndex < name.count && nameArr[endIndex] == "A" {
            endIndex += 1
        }
        if endIndex > i + 1 {
            let moveFront = i * 2  + name.count - endIndex
            let moveBack = ( name.count - endIndex) * 2 + i
            leftright = min(leftright, moveFront)
            leftright = min(leftright, moveBack)
        }
    }
    return sum + leftright
}
//A일때를 어떻게 돌아가야할지에서 막혔다. => 다음 좌표가 A일때 연속된 A들이 있으면 전부 시작점과 끝점을 통해 현재시점으로 부터 앞에서부터 가는길과 뒤에서 부터 가는길을 비교한다. 그래서 그 작은 값을 leftRight에 넣어준다. 여기서 생각해야할것은 방향을 세번이상바꾸는 케이스가 존재한가 이다. 그러한 케이스는 애초에 최소가 될수 없으므로 leftright는 한번만바뀐다.
