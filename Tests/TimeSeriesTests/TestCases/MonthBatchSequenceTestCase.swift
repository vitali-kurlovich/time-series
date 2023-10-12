import Foundation

struct MonthBatchSequenceTestCase {
    func month(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [[Date]] {
        [
            month_1(timeZone: timeZone),
            month_2(timeZone: timeZone),
            month_3(timeZone: timeZone),
            month_4(timeZone: timeZone),
        ]
    }
}

private
extension MonthBatchSequenceTestCase {
    func month_1(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2021-01-01 00:00:00.000",
            "2021-01-03 00:00:01.002",
            "2021-01-07 00:01:01.002",
            "2021-01-09 00:41:01.002",
            "2021-01-11 03:41:01.102",
            "2021-01-31 23:59:59.996",
        ].dates(timeZone: timeZone)
    }

    func month_2(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2021-02-01 00:00:00.000",
        ].dates(timeZone: timeZone)
    }

    func month_3(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2022-01-01 00:00:00.000",
        ].dates(timeZone: timeZone)
    }

    func month_4(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2022-05-01 00:00:00.000",
        ].dates(timeZone: timeZone)
    }
}
