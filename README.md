Queue
=====

[![Build Status](https://travis-ci.org/to4iki/Queue.svg)][status]
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)][license]

[status]: https://travis-ci.org/to4iki/Queue
[license]: https://github.com/to4iki/Queue/master/LICENSE

First-In-First-Out (FIFO) Simple Queue

## Description

Queue objects implement data structures that allow to  
insert and retrieve elements in a first-in-first-out (FIFO) manner.

## Usage

```swift
var queue = Queue<Int>()
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

### mutable.Queue<T>

- Instance Methods
    - `enqueue(elems: T...)`
    - `enqueue(elems: [T])`
    - `dequeue() -> (head: T, tail: [T])`
    - `dequeueOption() -> (head: T, tail: [T])?`
    - `dequeueFirst(predicate: T -> Bool) -> T?`
    - `dequeueAll(predicate: T -> Bool) -> [T]`
    - `clear()`
    - `front() -> T?`
    - `tail() -> Queue`

## Installation

## Licence

[MIT](https://github.com/to4iki/Queue/master/LICENSE)

## Author

[to4iki](https://github.com/to4iki)
