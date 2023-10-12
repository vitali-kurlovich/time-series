
import Foundation

struct HoursBatchSequenceTestCase {
    func hours(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [[Date]] {
        [
            hour_1(timeZone: timeZone),
            hour_2(timeZone: timeZone),
            hour_3(timeZone: timeZone),
            hour_4(timeZone: timeZone),
            hour_5(timeZone: timeZone),
        ]
    }
}

extension HoursBatchSequenceTestCase {
    func hour_1(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-01-01 00:00:00.000",
            "2023-01-01 00:00:01.002",
            "2023-01-01 00:01:01.002",
        ].dates(timeZone: timeZone)
    }

    func hour_2(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-01-01 01:41:01.002",
            "2023-01-01 01:41:01.102",
            "2023-01-01 01:59:59.102",
        ].dates(timeZone: timeZone)
    }

    func hour_3(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-01-01 02:00:00.000",
            "2023-01-01 02:00:00.000",

        ].dates(timeZone: timeZone)
    }

    func hour_4(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-03-01 02:00:00.000",
        ].dates(timeZone: timeZone)
    }

    func hour_5(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-03-02 02:00:00.000",
            "2023-03-02 02:00:00.001",
        ].dates(timeZone: timeZone)
    }
}
