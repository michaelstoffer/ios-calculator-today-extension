//
//  DigitAccumulator.swift
//  RPN
//
//  Created by Michael Stoffer on 9/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

public struct DigitAccumulator {
    public enum Digit: Equatable {
        case decimalPoint
        case number(Int)
    }
    
    public var digits = [Digit]()
    
    public init() {}
    
    public enum DigitAccumulatorError: Error {
        case extraDecimalPoint
        case invalidDigitNumberValue
    }
    
    public mutating func add(digit: Digit) throws {
        switch digit {
            case .decimalPoint:
                if digits.contains(.decimalPoint) {
                    throw DigitAccumulatorError.extraDecimalPoint
                }
            case .number(let value):
                if value < 0 || value > 9 {
                    throw DigitAccumulatorError.invalidDigitNumberValue
                }
        }
        
        self.digits.append(digit)
    }
    
    public mutating func clear() {
        self.digits.removeAll()
    }
    
    public func value() -> Double? {
        // Get all the digits from "digits", and turn them into a single Double.
        // If digits [1, 2, 3, .decimalPoint, 4, 5, 6] then return 123.456
        let string = digits.map { (digit) -> String in
            switch digit {
                case let .number(x): return String(x)
                case .decimalPoint: return "."
            }
        }.joined()
        
        return Double(string)
    }
}
