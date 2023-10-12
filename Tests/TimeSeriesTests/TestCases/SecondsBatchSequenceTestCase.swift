import Foundation

struct SecondsBatchSequenceTestCase {
    func seconds(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [[Date]] {
        [
            seconds_1(timeZone: timeZone),
            seconds_2(timeZone: timeZone),
            seconds_3(timeZone: timeZone),
        ]
    }
}

private
extension SecondsBatchSequenceTestCase {
    func seconds_1(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-01-01 00:00:00.000",
            "2023-01-01 00:00:00.002",
            "2023-01-01 00:00:00.992",
            "2023-01-01 00:00:00.999",
        ].dates(timeZone: timeZone)
    }

    func seconds_2(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-01-01 00:00:01.000",
            "2023-01-01 00:00:01.002",
            "2023-01-01 00:00:01.992",
            "2023-01-01 00:00:01.999",
        ].dates(timeZone: timeZone)
    }

    func seconds_3(timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> [Date] {
        try! [
            "2023-02-01 00:00:01.000",
            "2023-02-01 00:00:01.002",
            "2023-02-01 00:00:01.992",
            "2023-02-01 00:00:01.999",
        ].dates(timeZone: timeZone)
    }
}
