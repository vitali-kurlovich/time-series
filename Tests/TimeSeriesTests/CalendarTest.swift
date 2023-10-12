@testable import TimeSeries
import XCTest

final class CalendarTest: XCTestCase {
//    func testWeakOfYear() throws {
//        let timeZone = TimeZone(secondsFromGMT: 0)!
//        var calendar = Calendar(identifier: .iso8601)
//        calendar.timeZone = timeZone
//
//
//        let date = try "2019-01-01 00:00:00.000".date()
//
//
//        let date20 = calendar.date(from: DateComponents(year: 2021, weekday: 1))!
//
//        print(date20)
//
//        let dateNext = calendar.date(byAdding: .day, value: 220, to: date20)
//        print(dateNext)
//
//    }

    func testStartOfYear() throws {
        let timeZone = TimeZone(secondsFromGMT: 0)!
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = timeZone

        let dates = try [
            "2019-01-01 00:00:00.000",
            "2019-03-05 00:01:00.010",
            "2019-12-09 01:41:10.010",
            "2019-12-31 23:59:59.010",

            "2020-01-01 00:00:00.000",
            "2020-12-31 23:59:59.010",

            "2022-01-01 00:00:00.000",

            "2024-02-04 23:12:00.340",

        ].dates(timeZone: timeZone)

        let expected = try [
            "2019-01-01 00:00:00.000",
            "2019-01-01 00:00:00.000",
            "2019-01-01 00:00:00.000",
            "2019-01-01 00:00:00.000",

            "2020-01-01 00:00:00.000",
            "2020-01-01 00:00:00.000",

            "2022-01-01 00:00:00.000",

            "2024-01-01 00:00:00.000",

        ].dates(timeZone: timeZone)

        let result = dates.map {
            calendar.startOfYear(for: $0)
        }

        XCTAssertEqual(result, expected)
    }

    func testStartOfMonth() throws {
        let timeZone = TimeZone(secondsFromGMT: 0)!
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = timeZone

        let dates = try [
            "2019-01-01 00:00:00.000",
            "2019-01-05 00:01:00.010",
            "2019-01-09 01:41:10.010",

            "2019-02-01 02:12:10.010",
            "2019-02-28 23:59:00.000",

            "2019-03-01 00:00:00.000",

            "2020-01-01 02:12:10.010",

            "2020-02-01 02:12:10.010",
            "2020-02-29 23:59:59.010",

            "2020-03-01 00:00:00.000",
            "2020-03-02 00:00:00.000",

        ].dates(timeZone: timeZone)

        let expected = try [
            "2019-01-01 00:00:00.000",
            "2019-01-01 00:00:00.000",
            "2019-01-01 00:00:00.000",

            "2019-02-01 00:00:00.000",
            "2019-02-01 00:00:00.000",

            "2019-03-01 00:00:00.000",

            "2020-01-01 00:00:00.000",

            "2020-02-01 00:00:00.000",
            "2020-02-01 00:00:00.000",

            "2020-03-01 00:00:00.000",
            "2020-03-01 00:00:00.000",

        ].dates(timeZone: timeZone)

        let result = dates.map {
            calendar.startOfMonth(for: $0)
        }

        XCTAssertEqual(result, expected)
    }

    func testStartOfHour() throws {
        let timeZone = TimeZone(secondsFromGMT: 0)!
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = timeZone

        let dates = try [
            "2023-01-01 00:00:00.000",
            "2023-01-01 00:01:00.010",
            "2023-01-01 01:41:10.010",

            "2023-02-01 02:12:10.010",
            "2023-02-01 03:00:00.000",

        ].dates(timeZone: timeZone)

        let expected = try [
            "2023-01-01 00:00:00.000",
            "2023-01-01 00:00:00.000",
            "2023-01-01 01:00:00.000",
            "2023-02-01 02:00:00.000",
            "2023-02-01 03:00:00.000",

        ].dates(timeZone: timeZone)

        let result = dates.map {
            calendar.startOfHour(for: $0)
        }

        XCTAssertEqual(result, expected)
    }

    func testStartOfMinute() throws {
        let timeZone = TimeZone(secondsFromGMT: 0)!
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = timeZone

        let dates = try [
            "2023-01-01 00:00:00.000",
            "2023-01-01 00:01:00.010",
            "2023-01-01 01:41:10.010",

            "2023-02-01 02:12:10.010",
            "2023-02-01 03:00:00.000",

        ].dates(timeZone: timeZone)

        let expected = try [
            "2023-01-01 00:00:00.000",
            "2023-01-01 00:01:00.000",
            "2023-01-01 01:41:00.000",

            "2023-02-01 02:12:00.000",
            "2023-02-01 03:00:00.000",

        ].dates(timeZone: timeZone)

        let result = dates.map {
            calendar.startOfMinute(for: $0)
        }

        XCTAssertEqual(result, expected)
    }

    func testStartOfSecond() throws {
        let timeZone = TimeZone(secondsFromGMT: 0)!
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = timeZone

        let dates = try [
            "2019-01-01 00:00:00.000",

            "2019-01-02 00:00:00.000",
            "2019-01-02 00:00:00.010",
            "2019-01-02 00:00:00.012",
            "2019-01-02 00:00:00.112",

            "2019-01-02 06:01:00.000",
            "2019-01-02 06:01:00.010",
            "2019-01-02 06:01:00.012",
            "2019-01-02 06:01:00.112",

            "2019-01-02 06:01:06.000",
            "2019-01-02 06:01:06.010",
            "2019-01-02 06:01:06.012",
            "2019-01-02 06:01:06.999",

            "2019-01-02 06:01:07.112",

            "2020-01-02 06:01:07.112",

        ].dates(timeZone: timeZone)

        let expected = try [
            "2019-01-01 00:00:00.000",

            "2019-01-02 00:00:00.000",
            "2019-01-02 00:00:00.000",
            "2019-01-02 00:00:00.000",
            "2019-01-02 00:00:00.000",

            "2019-01-02 06:01:00.000",
            "2019-01-02 06:01:00.000",
            "2019-01-02 06:01:00.000",
            "2019-01-02 06:01:00.000",

            "2019-01-02 06:01:06.000",
            "2019-01-02 06:01:06.000",
            "2019-01-02 06:01:06.000",
            "2019-01-02 06:01:06.000",

            "2019-01-02 06:01:07.000",

            "2020-01-02 06:01:07.000",

        ].dates(timeZone: timeZone)

        let result = dates.map {
            calendar.startOfSecond(for: $0)
        }

        XCTAssertEqual(result, expected)
    }
}
