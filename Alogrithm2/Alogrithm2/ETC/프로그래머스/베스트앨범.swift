import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dicts : [String: [(Int, Int)]] = [:]
    var genreCounts: [String : Int] = [:]
    var result = [Int]()
    
    // Step 1: 장르별 곡 정보와 총 재생 횟수 저장
    for i in 0..<genres.count {
        dicts[genres[i], default: []].append((plays[i], i))
        genreCounts[genres[i], default: 0] += plays[i]
    }
    
    // Step 2: 장르별 재생 순위 정렬
    for genre in dicts.keys {
        dicts[genre]?.sort {
            if $0.0 == $1.0 {
                return $0.1 < $1.1
            }
            return $0.0 > $1.0
        }
    }
    
    // Step 3: 장르 순서 정렬
    let sortedGenres = genreCounts.sorted { $0.value > $1.value }.map { $0.key }
    
    // Step 4: 결과 도출
    for genre in sortedGenres {
        if let songs = dicts[genre] {
            for j in 0..<min(2, songs.count) {
                result.append(songs[j].1)
            }
        }
    }
    
    return result
}
