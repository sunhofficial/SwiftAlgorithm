import Foundation
let inp = readLine()!.split(separator: " " ).map{Int(String($0))!}
let row = inp[0], col = inp[1], N = inp[2]

var arr = [[(String, Int)]]()
for _ in 0..<row {
    let q = readLine()!.map{(String($0), 0)}
    arr.append(q)
}
let dir = [(0,1),(0,-1),(1,0),(-1,0)]
var t = 0
func setBomb() {
    for i in 0..<row {
        for j in 0..<col {
            if arr[i][j].0 == "." {
                arr[i][j] = ("O", t)
            }
        }
    }
}
func bomb() {
    var check = [(Int,Int)]()
    for i in 0..<row {
        for j in 0..<col {
            if arr[i][j] == ("O", t-3) {
                check.append((i,j))
                for k in 0..<4 {
                    let n = (i+dir[k].0, j+dir[k].1)
                    if n.0>=row||n.1>=col||n.0<0||n.1<0{continue}
                    check.append(n)
                }
            }
        }
    }
    check.forEach{arr[$0.0][$0.1] = (".", 0)}
}

while t < N {
    t += 1
    if t == 1 { continue }
    if t%2 == 0 {
        setBomb()
    }else {
        bomb()
    }
}
arr.forEach{
    print($0.map{$0.0}.joined())
}

