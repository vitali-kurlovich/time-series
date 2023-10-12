@testable import TimeSeries
import XCTest

final class MonthBatchSequenceTest: XCTestCase {
    func testBatch() throws {
        let testCase = MonthBatchSequenceTestCase()

        let expected = testCase.month()

        let test = expected.flatMap { $0 }

        let batchs = test.batch(by: .month)

        let result = batchs.map {
            $0.sequence
        }

        XCTAssertEqual(result, expected)

        let expectedIntevals = expected.map {
            DateInterval(start: $0.first!, end: $0.last!)
        }

        let resultTimeInterval = batchs.map {
            $0.timeInterval
        }

        XCTAssertEqual(resultTimeInterval, expectedIntevals)
    }
}
