import Foundation

public
struct TimeSequence<S: Sequence> where S.Element: TimeSeriesElement {
    public let timeInterval: DateInterval?
    public let sequence: S
}

extension TimeSequence: TimeSeriesSequence {
    public typealias Iterator = S.Iterator
    public typealias Element = S.Element

    public func makeIterator() -> S.Iterator {
        sequence.makeIterator()
    }
}
