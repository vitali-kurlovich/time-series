import Foundation

struct DayBatchSequenceTestCase_Step2 {}

extension DayBatchSequenceTestCase_Step2 {
    func days(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [[Date]] {
        [
            day_1(timeZone: timeZone),
            day_2(timeZone: timeZone),
            day_3(timeZone: timeZone),
            day_4(timeZone: timeZone),
        ]
    }
}

private
extension DayBatchSequenceTestCase_Step2 {
    func day_1(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-01-01 00:00:00.000",
            "2023-01-01 00:00:01.002",
            "2023-01-01 00:01:01.002",
            "2023-01-01 00:41:01.002",
            "2023-01-01 03:41:01.102",
            "2023-01-01 12:42:01.102",

            "2023-01-02 00:00:00.000",
            "2023-01-02 00:00:00.010",

        ].dates(timeZone: timeZone)
    }

    func day_2(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-01-03 00:00:00.010",

            "2023-01-04 23:00:00.010",
            "2023-01-04 23:59:59.910",

        ].dates(timeZone: timeZone)
    }

    func day_3(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-01-05 23:00:00.010",
            "2023-01-05 23:59:59.910",
        ].dates(timeZone: timeZone)
    }

    func day_4(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-02-01 23:59:59.910",
        ].dates(timeZone: timeZone)
    }
}
