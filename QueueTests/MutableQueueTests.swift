//
//  QueueTests.swift
//  QueueTests
//
//  Created by to4iki on 4/14/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import XCTest
import Queue

class MutableQueueTests: XCTestCase {
    
    var queue = MutableQueue<Int>()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        queue.clear()
        XCTAssertEqual(queue.count, 0)
    }
    
    func testEnqueue() {
        queue.enqueue(0)
        queue.enqueue(1,2)
        queue += 3
        XCTAssertEqual(queue.count, 4)
    }
    
    func testEnqueueLists() {
        queue.enqueue([0,1])
        queue ++= [2,3]
        XCTAssertEqual(queue.count, 4)
    }
    
    func testDequeue() {
        queue ++= [1,2,3]
        let (e, es) = queue.dequeue()
        XCTAssertEqual(e, 1)
        XCTAssertEqual(es, [2,3])
    }
    
    func testDequeueOption() {
        let r = queue.dequeueOption()
        XCTAssert(r == nil)
    }
    
    func testDequeueFirst() {
        queue ++= [1,2,3,4]
        let e = queue.dequeueFirst { $0 % 2 == 0 }
        XCTAssert(e == 2)
        XCTAssertEqual(queue.elements, [1,3,4])
    }
    
    func testDequeueAll() {
        queue ++= [1,2,3,4]
        let es = queue.dequeueAll { $0 % 2 == 0 }
        XCTAssertEqual(es, [2,4])
        XCTAssertEqual(queue.elements, [1,3])
    }
    
    func testFront() {
        queue.enqueue(1,2)
        XCTAssert(queue.front() == 1)
        XCTAssert(queue.first == 1)
        
        queue.clear()
        XCTAssert(queue.front() == nil)
    }
    
    func testTail() {
        queue ++= [1,2,3,4,5]
        let before = queue.count
        let after = queue.tail().count
        
        XCTAssertEqual(before - after, 1)
    }
}
