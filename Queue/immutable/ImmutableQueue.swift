//
//  ImmutableQueue.swift
//  Queue
//
//  Created by to4iki on 4/25/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

/**
*  `ImmutableQueue` objects implement data structures that allow to
*  insert and retrieve elements in a first-in-first-out (FIFO) manner.
*/
public struct ImmutableQueue<T: Equatable>: ImmutableQueueType {
    
    /// The type of element stored by this `ImmutableQueue`
    typealias Element = T
    
    /// The type of self
    typealias Queue = ImmutableQueue
    
    /// Sequence with elements
    private let elements: [T]
    
    /// Construct an empty Array
    public init() {
        self.elements = []
    }
    
    /// Construct from an arbitrary sequence with elements of type `T`
    public init(_ elements: [T]) {
        self.elements = elements
    }
    
    /// `true` if and only if the `Queue` is empty
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    /// How many elements the `Queue` stores
    public var count: Int {
        return elements.count
    }
    
    /// The first element, or `nil` if the queue is empty
    public var first: T? {
        return elements.first
    }
    
    /**
    Creates a new queue with element added at the end of the old queue.
    
    :param: elems the elements to insert
    
    :returns: new queue
    */
    public func enqueue(elems: T...) -> ImmutableQueue {
        var tmp = elements
        for e in elems {
            tmp.append(e)
        }
        return ImmutableQueue(tmp)
    }
    
    /**
    Creates a new queue with element added at the end of the old queue.
    
    :param: elems the elements to insert
    
    :returns: new queue
    */
    public func enqueue(elems: [T]) -> ImmutableQueue {
        var tmp = elements
        for e in elems {
            tmp.append(e)
        }
        return ImmutableQueue(tmp)
    }
    
    /**
    Returns a tuple with the first element in the queue,
    and a new queue with this element removed.
    
    :returns: A tuple of the first element of the queue.
    */
    public func dequeue() -> (head: T, tail: [T]) {
        var tmp = elements
        let res = tmp[0]
        tmp.removeAtIndex(0)
        return (res, tmp)
    }
    
    /**
    Optionally retrieves the first element and a queue of the remaining elements.
    
    :returns: A tuple of the first element of the queue, and a new queue with this element removed. If the queue is empty, None is returned.
    */
    public func dequeueOption() -> (head: T, tail: [T])? {
        if isEmpty { return nil }
        
        var tmp = elements
        let res = tmp[0]
        tmp.removeAtIndex(0)
        return (res, tmp)
    }
    
    /**
    Returns the first element in the queue, or throws an error if there is no element contained in the queue.
    Alias for `first`
    
    :returns: the first element.
    */
    public func front() -> T? {
        return first
    }
    
    /**
    Selects all elements except the first.
    
    :returns: a immutable queue consisting of all elements of this immutable queue except the first one.
    */
    public func tail() -> ImmutableQueue {
        return ImmutableQueue(Array(elements[1..<count]))
    }
}

/**
*  Printable
*/
extension ImmutableQueue {
    public var description: String {
        return "ImmutableQueue: elements: \(elements)"
    }
}

/**
Equatable

:param: lhs Left hand side
:param: rhs Right hand side

:returns: inequal
*/
public func == <T: Equatable>(lhs: ImmutableQueue<T>, rhs: ImmutableQueue<T>) -> Bool {
    return lhs.elements == rhs.elements
}

