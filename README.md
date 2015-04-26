Queue
=====

[![Build Status](https://travis-ci.org/to4iki/Queue.svg)][status]
[![Version](https://img.shields.io/cocoapods/v/Queue.svg?style=flat)][version]
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)][license]
[![Platform](https://img.shields.io/cocoapods/p/Queue.svg?style=flat)][platform]

[status]: https://travis-ci.org/to4iki/Queue
[version]: http://cocoadocs.org/docsets/Queue
[license]: https://github.com/to4iki/Queue/master/LICENSE
[platform]: http://cocoadocs.org/docsets/Queue

First-In-First-Out (FIFO) Simple Queue(immutable|mutable)

## Description

Queue objects implement data structures that allow to  
insert and retrieve elements in a first-in-first-out (FIFO) manner.

## Usage

### ImmutableQueue<T>
```swift
let queue = ImmutableQueue<Int>()
```

#### enqueue
```swift
let q1 = queue.enqueue(1) // ImmutableQueue(1)
let q123 = q1.enqueue(2,3) // ImmutableQueue(1,2,3)
let q12345 = q123.enqueue([4,5]) // ImmutableQueue(1,2,3,4,5)
```

#### dequeue
```swift
let q123 = queue.enqueue(1,2,3)
let (q, qs) = q123.dequeue()
q // 1
qs // [2,3]
```

### MutableQueue<T>
```swift
var queue = MutableQueue<Int>()
```

#### enqueue(+=)
```swift
queue.enqueue(0)
queue.enqueue(1,2)
queue += 3
queue.count // 4
```

#### enqueue(++=)
```swift
queue.enqueue([0,1])
queue ++= [2,3]
queue.count // 4
```

#### dequeue
```swift
queue ++= [1,2,3]
let res = queue.dequeue()
res.head // 1
res.tail // [2.3]
```

#### clear
```swift
queue ++= [1,2,3]
queue.clear()
queue.count // 0
```

## Methods

### immutable.ImmutableQueue<T>

- Instance Methods
    - `enqueue(elems: T...) -> ImmutableQueue`
    - `enqueue(elems: [T]) -> ImmutableQueue`
    - `dequeue() -> (head: T, tail: [T])`
    - `dequeueOption() -> (head: T, tail: [T])?`
    - `front() -> T?`
    - `tail() -> ImmutableQueue`

### mutable.MutableQueue<T>

- Instance Methods
    - `enqueue(elems: T...)`
    - `enqueue(elems: [T])`
    - `dequeue() -> (head: T, tail: [T])`
    - `dequeueOption() -> (head: T, tail: [T])?`
    - `dequeueFirst(predicate: T -> Bool) -> T?`
    - `dequeueAll(predicate: T -> Bool) -> [T]`
    - `clear()`
    - `front() -> T?`
    - `tail() -> MutableQueue`

## Installation

## Licence

[MIT](https://github.com/to4iki/Queue/master/LICENSE)

## Author

[to4iki](https://github.com/to4iki)
