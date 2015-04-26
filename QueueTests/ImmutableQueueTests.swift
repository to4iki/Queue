//
//  ImmutableQueueTests.swift
//  Queue
//
//  Created by to4iki on 4/26/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import XCTest
import Queue

class ImmutableQueueTests: XCTestCase {
    
    let queue = ImmutableQueue<Int>()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        XCTAssertEqual(queue.count, 0)
    }
    
    func testEnqueue() {
        let q1 = queue.enqueue(1)
        XCTAssertEqual(q1.count, 1)
        
        let q123 = q1.enqueue(2,3)
        XCTAssertEqual(q123.count, 3)
        
        let q12345 = q123.enqueue([4,5])
        XCTAssertEqual(q12345.count, 5)
    }
    
    func testDequeue() {
        let q123 = queue.enqueue(1,2,3)
        let (e, es) = q123.dequeue()
        XCTAssertEqual(e, 1)
        XCTAssertEqual(es, [2,3])
    }
    
    func testDequeueOption() {
        let r = queue.dequeueOption()
        XCTAssert(r == nil)
    }
    
    func testFront() {
        XCTAssert(queue.first == nil)
        
        let q123 = queue.enqueue(1,2,3)
        XCTAssert(q123.front() == 1)
        XCTAssert(q123.first == 1)
    }
    
    func testTail() {
        let q123 = queue.enqueue(1,2,3)
        let before = q123.count
        let after = q123.tail().count
        
        XCTAssertEqual(before - after, 1)
    }
}