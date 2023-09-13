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
    func testSchoolsAPICall() async{
        let expectedOutput =  true
        /// When the Data initializer is throwing an error, the test will fail.
       try await viewModel.getSchools(url: viewModel.url.schoolUrl)
        let actualOutput = {self.viewModel.schools.count > 0}

        XCTAssertEqual(expectedOutput, actualOutput())
    }
    
    func testSatsAPICall() async {
        let expectedOutput = true
        try await viewModel.getSats(url: self.viewModel.url.satUrl)
        let actualOutput = {self.viewModel.schoolSats.count > 0}
        XCTAssertEqual(expectedOutput,actualOutput())
    }

    func testFilterSatArray() async {
        // This is an example of a performance test case.
         let satDbn = "01M448"
         let expectedSchoolName = "UNIVERSITY NEIGHBORHOOD HIGH SCHOOL"
        try await viewModel.getSats(url: self.viewModel.url.satUrl)
        let sat =  viewModel.getSat(dbn: satDbn)
        XCTAssertEqual(sat?.schoolName,expectedSchoolName)
    }

}
