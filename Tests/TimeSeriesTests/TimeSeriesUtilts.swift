import Foundation
@testable import TimeSeries

extension Date: TimeSeriesElement {
    public var time: Date {
        self
    }
}

enum TimeSeriesUtilts {}

extension TimeSeriesUtilts {
    static func dateFormatter(dateFormat: String = "yyyy-MM-dd HH:mm:ss.SSS", timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> DateFormatter {
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = dateFormat
        RFC3339DateFormatter.timeZone = timeZone
        return RFC3339DateFormatter
    }
}

enum MapDateError: Error {
    case invalidDateFormat(String?)
}

extension StringProtocol {
    func date(dateFormat: String = "yyyy-MM-dd HH:mm:ss.SSS", timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) throws -> Date {
        let formatter = TimeSeriesUtilts.dateFormatter(dateFormat: dateFormat, timeZone: timeZone)

        guard let date = formatter.date(from: .init(self)) else {
            throw MapDateError.invalidDateFormat(.init(self))
        }

        return date
    }
}

extension Sequence where Self.Element == String {
    func dates(dateFormat: String = "yyyy-MM-dd HH:mm:ss.SSS", timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) throws -> [Date] {
        let formatter = TimeSeriesUtilts.dateFormatter(dateFormat: dateFormat, timeZone: timeZone)

        return try map {
            guard let date = formatter.date(from: $0) else {
                throw MapDateError.invalidDateFormat($0)
            }

            return date
        }
    }
}
