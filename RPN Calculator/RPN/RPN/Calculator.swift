//
//  Calculator.swift
//  RPN
//
//  Created by Michael Stoffer on 9/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

public struct Calculator {
    private var stack: Stack<Double> = [0.0, 0.0]
    
    public var topValue: Double? {
        return stack.peek()
    }
    
    public enum Operator {
        case add, subtract, multiply, divide
    }
    
    public init() {}
    
    public mutating func push(number: Double) {
        self.stack.push(number)
    }
    
    public mutating func push(operator: Operator) {
        let operand2 = stack.pop() ?? 0.0
        let operand1 = stack.pop() ?? 0.0
        let result: Double
        switch `operator` {
            case .add:
                result = operand1 + operand2
            case .subtract:
                result = operand1 - operand2
            case .multiply:
                result = operand1 * operand2
            case .divide:
                result = operand1 / operand2
        }
        
        stack.push(result)
    }
    
    public mutating func clear() {
        stack = []
    }
}
