import Foundation

public enum TimeSeriesComponent {
    case year
    case month
    case day
    case hour
    case minute
    case second
}

extension Sequence where Self.Element: TimeSeriesElement {
    func batch(by component: TimeSeriesComponent, collected: Int = 1, timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> BatchTimeSeriesSequence<Self> {
        return BatchTimeSeriesSequence(self, component: component, collected: collected, timeZone: timeZone)
    }
}

public struct BatchTimeSeriesSequence<S: Sequence> where S.Element: TimeSeriesElement {
    private let source: S
    private let collected: Int
    private let component: TimeSeriesComponent
    private let timeZone: TimeZone

    public init(_ source: S, component: TimeSeriesComponent = .day, collected: Int = 1, timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) {
        assert(collected > 0)

        self.source = source
        self.collected = collected
        self.component = component
        self.timeZone = timeZone
    }
}

extension BatchTimeSeriesSequence: Sequence {
    public typealias Element = TimeSequence<[S.Element]>

    public func makeIterator() -> Iterator {
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = timeZone

        return .init(source: source, component: component, collected: collected, calendar: calendar)
    }
}

public extension BatchTimeSeriesSequence {
    struct Iterator: IteratorProtocol {
        private let calendar: Calendar
        private let collected: Int
        private let component: TimeSeriesComponent
        private var iterator: S.Iterator
        private var last: S.Element?

        public
        init(source: S, component: TimeSeriesComponent, collected: Int, calendar: Calendar) {
            assert(collected > 0)

            self.calendar = calendar
            self.collected = collected
            self.component = component
            iterator = source.makeIterator()
            last = iterator.next()
        }

        public typealias Element = TimeSequence<[S.Element]>

        public
        mutating func next() -> Element? {
            guard let last = last else {
                return nil
            }

            var items: [S.Element] = [last]

            let start = last.time
            var end = last.time

            let lastDate = endDate(for: start)

            while let current = iterator.next() {
                self.last = current

                if current.time < lastDate {
                    items.append(current)
                    end = current.time
                } else {
                    let timeInterval: DateInterval = .init(start: start, end: end)
                    return .init(timeInterval: timeInterval, sequence: items)
                }
            }

            self.last = nil

            let timeInterval: DateInterval = .init(start: start, end: end)

            return .init(timeInterval: timeInterval, sequence: items)
        }

        private
        func endDate(for date: Date) -> Date {
            switch component {
            case .year:
                let begin = calendar.startOfYear(for: date)
                return calendar.date(byAdding: .year, value: collected, to: begin)!
            case .month:
                let begin = calendar.startOfMonth(for: date)
                return calendar.date(byAdding: .month, value: collected, to: begin)!

            case .day:
                let begin = calendar.startOfDay(for: date)
                return calendar.date(byAdding: .day, value: collected, to: begin)!
            case .hour:
                let begin = calendar.startOfHour(for: date)
                return calendar.date(byAdding: .hour, value: collected, to: begin)!
            case .minute:
                let begin = calendar.startOfMinute(for: date)
                return calendar.date(byAdding: .minute, value: collected, to: begin)!
            case .second:
                let begin = calendar.startOfSecond(for: date)
                return calendar.date(byAdding: .second, value: collected, to: begin)!
            }
        }
    }
}
