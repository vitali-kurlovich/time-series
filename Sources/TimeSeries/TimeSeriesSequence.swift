import Foundation

public protocol TimeSeriesSequence: Sequence where Self.Element: TimeSeriesElement {
    var timeInterval: DateInterval? { get }
}
