import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
      var result = [String]()
    
    for targetcnt in course{
        var dic = [String: Int]()
        var str = ""
        func combi(_ start: Int, _ target: Int, _ word: String){
            //원하는 조합 요소의 개수가 단어의 개수보다 크면 리턴
            if target > word.count{
                return
            }
            //원하는 개수가 모이면 단어를 딕셔너리에 저장, +1하고 리턴
            if str.count == target{
                var sortedstr = String(str.sorted(by: <))
                dic[sortedstr] = (dic[sortedstr] ?? 0) + 1
                return
            }

            for i in start+1..<word.count{
                str += String(Array(word)[i])
                combi(i, target, word)
                str.removeLast()
            }
        }
        
        //메뉴별 조합의 개수를 가져와서
        for menu in orders{
            combi(-1, targetcnt, menu)
        }
        //n개별 조합의 최대치를 가져와서 1개 이상이면 최대치의 개수에 해당하는 조합을 저장
        let max = dic.values.max() ?? 0
        if max > 1{
            for best in dic.filter({ $0.value == max}).keys{
                result.append(best)
            }
            
        }
    }
    
    return result.sorted(by: <)

}
