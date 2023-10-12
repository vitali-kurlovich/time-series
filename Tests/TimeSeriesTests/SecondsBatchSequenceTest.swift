@testable import TimeSeries
import XCTest

final class SecondsBatchSequenceTest: XCTestCase {
    func testBatch() throws {
        let testCase = SecondsBatchSequenceTestCase()

        let expected = testCase.seconds()

        let test = expected.flatMap { $0 }

        let batchs = test.batch(by: .second)

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
