@testable import TimeSeries
import XCTest

final class HoursBatchSequenceTest: XCTestCase {
    func testBatch() throws {
        let testCase = HoursBatchSequenceTestCase()

        let expected = testCase.hours()

        let test = expected.flatMap { $0 }

        let batchs = test.batch(by: .hour)

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

    func testBatchCollcted_2() throws {
        let testCase = HoursBatchSequenceTestCase_Step2()

        let expected = testCase.hours()

        let test = expected.flatMap { $0 }

        let batchs = test.batch(by: .hour, collected: 2)

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
