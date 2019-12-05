//
//  Stack.swift
//  RPN
//
//  Created by Michael Stoffer on 9/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

struct Stack <T> : ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = T
    
    private (set) var items: [T]
    
    init(arrayLiteral elements: ArrayLiteralElement...) {
        self.items = elements
    }
    
    init(_ initialElements: [T] = [T]()) {
        self.items = initialElements
    }
    
    mutating func push(_ value: T) {
        self.items.append(value)
    }
    
    mutating func pop() -> T? {
        return self.items.popLast()
    }
    
    // See the top thing on the stack without removing it
    func peek() -> T? {
        return self.items.last
    }
}
