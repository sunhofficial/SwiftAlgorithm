import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result = Set<Set<String>>()
    var matchDict = [Int: [String]]()
    for (i,banid) in banned_id.enumerated() {
        matchDict[i] = findMatchID(user_id, banid)
    }
    func dfs(level: Int, ids: Set<String>) {
        if level != ids.count { return }

        if level == banned_id.count {
            result.insert(ids)
            return
        }

        for matchId in matchDict[level]! {
            dfs(level: level+1, ids: ids.union([matchId]))
        }
    }

    dfs(level: 0, ids: [])

    return result.count
}
func findMatchID(_ userids: [String], _ banid: String) -> [String ]{
    var ids = [String]()
    outside: for userId in userids {
        if userId.count != banid.count {
            continue
        }
        for idx in banid.indices {
            if userId[idx] != banid[idx] && banid[idx] != "*" {
                continue outside
            }
        }
        ids.append(userId)
    }
    return ids
}
