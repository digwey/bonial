//
//  CodingChallengeTests.swift
//  CodingChallengeTests
//
//  Created by Mohamed Digwey on 4/9/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import XCTest
@testable import CodingChallenge

class CodingChallengeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInitSectorModel(){
        //Generating Nil Sector model
        let sectorModel = SectorModel(id: -1, name: "TestedModel", url: "MYURL")
        
        //It should be success because Sector Model with negative ID generate nil Model
        XCTAssertNil(sectorModel)
        
        //Successfully generated Sector model
        let sectorModelSuccessed = SectorModel(id: 1, name: "TestedModel 1", url: "MYURL")
        
        //Test to insure mapping between model consturctor and model properties
        XCTAssertEqual(sectorModelSuccessed!.id,1)
        XCTAssertEqual(sectorModelSuccessed!.name,"TestedModel 1")
        XCTAssertEqual(sectorModelSuccessed!.url,"MYURL")
        
    }
    
}
