//
//  MoedaDigitalTests.swift
//  MoedaDigitalTests
//
//  Created by Felipe Augusto Vendrasco on 21/01/21.
//

import XCTest
@testable import MoedaDigital

class MoedaDigitalTests: XCTestCase {
//
//    override func setUpWithError() throws {
//
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func celulaVazia(){
        let tabela = UITableView()
        let vc = ViewController()
        vc.listaMoeda = []
    }

}
