import Foundation

struct MinutesBatchSequenceTestCase {
    func minutes(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [[Date]] {
        [
            minutes_1(timeZone: timeZone),
            minutes_2(timeZone: timeZone),
            minutes_3(timeZone: timeZone),
            minutes_4(timeZone: timeZone),
        ]
    }
}

private
extension MinutesBatchSequenceTestCase {
    func minutes_1(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-01-01 00:00:00.000",
            "2023-01-01 00:00:01.002",
            "2023-01-01 00:00:59.992",
        ].dates(timeZone: timeZone)
    }

    func minutes_2(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-01-01 00:01:00.000",
            "2023-01-01 00:01:00.102",
            "2023-01-01 00:01:00.102",
        ].dates(timeZone: timeZone)
    }

    func minutes_3(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2024-01-01 00:01:00.000",

        ].dates(timeZone: timeZone)
    }

    func minutes_4(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2024-02-01 01:51:00.02",
            "2024-02-01 01:51:01.02",
        ].dates(timeZone: timeZone)
    }
}
