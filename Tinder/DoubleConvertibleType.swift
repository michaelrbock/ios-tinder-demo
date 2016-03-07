//
//  DoubleConvertibleType.swift
//  Tinder
//
//  Created by Michael Bock on 3/6/16.
//  Copyright © 2016 Michael R. Bock. All rights reserved.
//

import UIKit
import Foundation

protocol DoubleConvertibleType {
    init(_ value: Double)
    var doubleValue: Double { get }
}

extension Double : DoubleConvertibleType { var doubleValue: Double { return self         } }
extension Float  : DoubleConvertibleType { var doubleValue: Double { return Double(self) } }
extension CGFloat: DoubleConvertibleType { var doubleValue: Double { return Double(self) } }

extension DoubleConvertibleType {
    var degreesToRadians: DoubleConvertibleType {
        return doubleValue * M_PI / 180
    }
    var radiansToDegrees: DoubleConvertibleType {
        return doubleValue * 180 / M_PI
    }
    var floatValue: Float {
        return Float(doubleValue)
    }
    var cgFloatValue: CGFloat {
        return CGFloat(doubleValue)
    }
}
