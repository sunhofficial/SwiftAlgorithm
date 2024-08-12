import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dicts = [String: [String]]()
    
    for clo in clothes {
        dicts[clo[1], default: []].append(clo[0])
    }
    var result = 1
    for (_, items) in dicts {
        result *= (items.count + 1)
    }
    return result - 1
    ///
    ///let counts = Set(clothes.compactMap({$0.last})).map({category in  return clothes.filter({$0.last == category}).count + 1})
    ///return counts.reduce(1, {$0 * $1}) - 1
    ///
}

