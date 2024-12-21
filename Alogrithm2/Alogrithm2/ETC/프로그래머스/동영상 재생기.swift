import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    var current = toMinutes(time: pos)
    let endTime = toMinutes(time: video_len)
    let opStart = toMinutes(time: op_start)
    let opEnd = toMinutes(time: op_end)
    for i in commands {
        current = opStart ... opEnd ~= current ? opEnd : current
        if i == "next" {
            current = min(current + 10, endTime)
        } else if i == "prev" {
            current = max(0, current - 10)
        }

    }
    current = opStart ... opEnd ~= current ? opEnd : current

    return toTime(minutes: current)
}
func toMinutes(time: String) -> Int {
    let times = time.split(separator: ":").map{Int($0)!}
    return times[0] * 60 + times[1]
}
func toTime(minutes: Int) -> String {
    let hours = minutes / 60
    let minutes = minutes % 60
    return String(format: "%02d:%02d", hours, minutes)
}
