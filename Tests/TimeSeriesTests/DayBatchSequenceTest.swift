@testable import TimeSeries
import XCTest

final class DayBatchSequenceTest: XCTestCase {
    func testBatch() throws {
        let testCase = DayBatchSequenceTestCase()

        let expected = testCase.days()

        let test = expected.flatMap { $0 }

        let batchs = test.batch(by: .day)

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

    func testBatchCollcted2() throws {
        let testCase = DayBatchSequenceTestCase_Step2()

        let expected = testCase.days()

        let test = expected.flatMap { $0 }

        let batchs = test.batch(by: .day, collected: 2)

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
