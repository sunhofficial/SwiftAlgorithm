// 13460
import Foundation

struct State: Hashable {
    let red: Pos
    let blue: Pos
    let count: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(red)
        hasher.combine(blue)
    }
    
    static func == (lhs: State, rhs: State) -> Bool {
        return lhs.red == rhs.red && lhs.blue == rhs.blue
    }
}
struct Pos: Hashable {
    let x: Int
    let y: Int
}

enum Direction: Int, CaseIterable{
    case up
    case down
    case left
    case right
}

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var board = [[Character]]()
for _ in 0..<n {
    board.append(Array(readLine()!))
}

var redPos = Pos(x: 0, y: 0 )
var bluePos =  Pos(x: 0, y: 0 )
var holePos =  Pos(x: 0, y: 0 )
for i in 0..<n {
    for j  in 0..<m {
        if board[i][j] == "R" {
            redPos = Pos(x: j, y: i)
            board[i][j] = "."
        } else if board[i][j] == "B" {
            bluePos = Pos(x: j, y: i)
            board[i][j] = "."
            
        } else if board[i][j] == "O" {
            holePos  = Pos(x: j, y: i)
        }
    }
}
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]


func bfs() -> Int {
    var queue: [State] = []
    var visited = Set<State>()
    let initialState = State(red: redPos, blue: bluePos, count: 0)
    queue.append(initialState)
    visited.insert(initialState)
    var index = 0
    while index < queue.count {
        let current = queue[index]
        index += 1
        if current.count >= 10 {
            continue
        }
        for dir in Direction.allCases {
            let (newR, newB, redInHole , blueInHole) = move(red: current.red, blue: current.blue, direction: dir)
            if blueInHole {
                continue
            }
            if redInHole {
                return current.count + 1
            }
            let newState = State(red: newR, blue: newB, count: current.count + 1)
            if visited.contains(newState) {
                continue
            }
            visited.insert(newState)
            queue.append(newState)
        }
    }
    return -1
    
}
print(bfs())



private func move(red: Pos, blue: Pos, direction: Direction) -> (Pos, Pos, Bool, Bool ) {
    var newRed = red
    var newBlue = blue
    var redInHole = false
    var blueInHole = false
    let redFirst = isMoveRedFirst(red: red, blue: blue, direction: direction)
    if redFirst {
        (newRed, redInHole) = moveOne(pos: red, direction: direction, otherPos: blue, otherInHole: blueInHole)
        (newBlue, blueInHole) = moveOne(pos: blue, direction: direction, otherPos: newRed, otherInHole: redInHole)
    } else {
        (newBlue,blueInHole) = moveOne(pos: blue, direction: direction, otherPos: red, otherInHole: redInHole)
        (newRed,redInHole) = moveOne(pos: red, direction: direction, otherPos: newBlue, otherInHole: blueInHole)
    }
    return (newRed, newBlue, redInHole, blueInHole)
}
private func moveOne(pos: Pos, direction: Direction, otherPos: Pos, otherInHole: Bool) -> (Pos,Bool) {
    var newX = pos.x
    var newY = pos.y
    var inHole = false
    while true {
        let nx = newX + dx[direction.rawValue]
        let ny = newY + dy[direction.rawValue]
        if board[ny][nx] == "#" {
            break
        }
        if !otherInHole && nx == otherPos.x && ny == otherPos.y {
            break
        }
        newX = nx
        newY = ny
        if nx == holePos.x && ny == holePos.y {
            inHole = true
            break
        }
    }
    return (Pos(x: newX, y: newY), inHole)
}

private func isMoveRedFirst(red: Pos, blue: Pos, direction: Direction) -> Bool {
    switch direction {
    case .up:
        return red.y < blue.y
    case .down:
        return red.y > blue.y
    case .left:
        return red.x < blue.x
    case .right:
        return red.x > blue.x
        
    }
}

