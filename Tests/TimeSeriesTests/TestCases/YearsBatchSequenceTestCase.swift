import Foundation

struct YearsBatchSequenceTestCase {
    func years(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [[Date]] {
        [
            year_1(timeZone: timeZone),
            year_2(timeZone: timeZone),
            year_3(timeZone: timeZone),
        ]
    }
}

private
extension YearsBatchSequenceTestCase {
    func year_1(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2020-01-01 00:00:00.000",
            "2020-02-02 00:00:01.002",
            "2020-03-11 00:01:01.002",
            "2020-04-01 00:41:01.002",
            "2020-11-19 03:41:01.102",
            "2020-12-31 23:59:59.102",
        ].dates(timeZone: timeZone)
    }

    func year_2(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2021-01-01 00:00:00.000",
            "2021-12-31 23:59:59.102",
        ].dates(timeZone: timeZone)
    }

    func year_3(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-11-01 00:00:00.000",
            "2023-11-20 23:59:59.102",
        ].dates(timeZone: timeZone)
    }
}
