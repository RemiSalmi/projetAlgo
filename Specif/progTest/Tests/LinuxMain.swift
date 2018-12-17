import XCTest

import progTestTests

var tests = [XCTestCaseEntry]()
tests += progTestTests.allTests()
XCTMain(tests)