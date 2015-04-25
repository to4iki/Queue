//
//  MutableQueue.swift
//  MutableQueue
//
//  Created by to4iki on 4/14/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

/**
*  `Queue` objects implement data structures that allow to
*  insert and retrieve elements in a first-in-first-out (FIFO) manner.
*/
public struct MutableQueue<T: Equatable>: MutableQueueType {
    
    /// The type of element stored by this `Queue`
    typealias Element = T
    
    /// Sequence with elements
    public var elements: [T] = []
    
    /// Construct an empty Array
    public init() {}
    
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
    Adds all elements to the queue.
    Alias for `+=`
    
    :param: elems the elements to add.
    */
    public mutating func enqueue(elems: T...) {
        for e in elems {
            elements.append(e)
        }
    }
    
    /**
    Adds all elements to the queue.
    Alias for `++=`
    
    :param: elems the elements to add.
    */
    public mutating func enqueue(elems: [T]) {
        for e in elems {
            elements.append(e)
        }
    }
    
    /**
    Returns a tuple with the first element in the queue, 
    and a new queue with this element removed.
    
    :returns: A tuple of the first element of the queue.
    */
    public mutating func dequeue() -> (head: T, tail: [T]) {
        let res = elements[0]
        elements.removeAtIndex(0)
        return (res, elements)
    }
    
    /**
    Optionally retrieves the first element and a queue of the remaining elements.
    
    :returns: A tuple of the first element of the queue, 
    and a new queue with this element removed. If the queue is empty, nil is returned.
    */
    public mutating func dequeueOption() -> (head: T, tail: [T])? {
        if isEmpty { return nil }
        
        let res = elements[0]
        elements.removeAtIndex(0)
        return (res, elements)
    }
    
    /**
    Returns the first element in the queue which satisfies the given predicate,
    and removes this element from the queue.
    
    :param: predicate the predicate used for choosing the first element
    
    :returns: the first element of the queue for which p yields true
    */
    public mutating func dequeueFirst(predicate: T -> Bool) -> T? {
        if isEmpty { return nil }
        
        var res: T?
        var found = false
        for (i, item) in enumerate(elements) {
            if !found && predicate(item) {
                found = true
                res = item
                elements.removeAtIndex(i)
            }
        }
        
        return res
    }
    
    /**
    Returns all elements in the queue which satisfy the given predicate,
    and removes those elements from the queue.
    
    :param: predicate the predicate used for choosing elements
    
    :returns: a sequence of all elements in the queue for which p yields true.
    */
    public mutating func dequeueAll(predicate: T -> Bool) -> [T] {
        var res: [T] = []
        var counter = 0
        
        for (i, item) in enumerate(elements) {
            if predicate(item) {
                res.append(item)
                elements.removeAtIndex(i - counter)
                counter++
            }
        }

        return res
    }
    
    /**
    Clear all elements.
    */
    public mutating func clear() {
        elements = [T]()
    }
    
    /**
    The first element, or `nil` if the queue is empty
    Alias for `first`
    
    :returns: the first element.
    */
    public func front() -> T? {
        return first
    }
    
    /**
    Returns the rest of this queue
    
    :returns: a mutable queue consisting of all elements of this mutable queue except the first one.
    */
    public func tail() -> MutableQueue {
        return MutableQueue(Array(elements[1..<count]))
    }
}

/**
*  Printable
*/
extension MutableQueue {
    public var description: String {
        return "MutableQueue: elements: \(elements)"
    }
}

/**
Equatable

:param: lhs Left hand side
:param: rhs Right hand side

:returns: inequal
*/
public func == <T: Equatable>(lhs: MutableQueue<T>, rhs: MutableQueue<T>) -> Bool {
    return lhs.elements == rhs.elements
}

/**
Enqueue a single element to this queue

:param: queue mutable queue.
:param: elem  the element to append.
*/
public func += <T>(inout queue: MutableQueue<T>, elem: T) {
    queue.enqueue(elem)
}

/**
Enqueue all elements to this queue

:param: queue mutable queue.
:param: elems the elements to append.
*/
public func ++= <T>(inout queue: MutableQueue<T>, elems: [T]) {
    queue.enqueue(elems)
}
