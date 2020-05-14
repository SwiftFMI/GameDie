import XCTest
@testable import GameDie

final class GameDieTests: XCTestCase {
    func testRoll() {
        do {
            let die = try Die(faces: Array(1...6))
            
            var results = [Int]()
            
            for _ in 1...150 {
                if results.count == 6 {
                    break
                }
                
                let roll = die.roll()
                
                if results.contains(roll) == false {
                    results.append(roll)
                }
            }
            
            XCTAssertTrue(results.sorted() == Array(1...6), "Could not roll all the die faces!")
        }
        catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    static var allTests = [
        ("testRoll", testRoll),
    ]
}
