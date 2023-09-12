//
//  _02309StanleyGodfrey_NYCSchoolsTests.swift
//  202309StanleyGodfrey-NYCSchoolsTests
//
//  Created by Uche Godfrey on 9/10/23.
//

import XCTest
@testable import _02309StanleyGodfrey_NYCSchools

final class _02309StanleyGodfrey_NYCSchoolsTests: XCTestCase {
    var viewModel:SchoolViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        viewModel = SchoolViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        viewModel =  nil
    }
    func testSchoolsAPICall(){
        viewModel.schools
        /// When the Data initializer is throwing an error, the test will fail.
           let jsonData = try Data(contentsOf: URL(string: "user.json")!)

           /// The `XCTAssertNoThrow` can be used to get extra context about the throw
           XCTAssertNoThrow(try JSONDecoder().decode(User.self, from: jsonData))
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
