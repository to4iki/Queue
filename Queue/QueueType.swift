//
//  QueueType.swift
//  Queue
//
//  Created by to4iki on 4/19/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

public protocol QueueType {
    
    /// `true` if and only if the `Queue` is empty
    var isEmpty: Bool { get }
    
    /// How many elements the `Queue` stores
    var count: Int { get }
}

/**
*  A type of first-in-first-out (FIFO) Mutable Queue.
*/
public protocol MutableQueueType: QueueType {
    typealias Element
    
    /// Adds all elements to the queue.
    mutating func enqueue(elems: Element...)
    
    /// Returns a tuple with the first element in the queue,
    /// and a new queue with this element removed.
    mutating func dequeue() -> (head: Element, tail: [Element])
}

/**
*  A type of first-in-first-out (FIFO) Immutable Queue.
*/
public protocol ImmutableQueueType: QueueType {
    typealias Element
    
    /// Adds all elements to the queue.
    func enqueue(elems: Element...) -> [Element]
    
    /// Returns a tuple with the first element in the queue,
    /// and a new queue with this element removed.
    func dequeue() -> (head: Element, tail: [Element])
}