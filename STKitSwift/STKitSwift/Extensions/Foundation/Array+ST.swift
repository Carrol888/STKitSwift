
//
//  Array+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/8.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation

public extension Array {
    public static func arrayRandom(totoal:Int, times:Int) -> Array<Int> {
        var totoal = totoal
        var arrayMutable : Array<Int> = Array<Int>()
        let times = arc4random_uniform(UInt32(times)) + 1
        for _ in 0...times {
            let number = Int(arc4random_uniform(UInt32(totoal)))
            arrayMutable.append(number)
            totoal = totoal - number

            if totoal == 0{
                break
            }
        }
        if totoal != 0 {
            arrayMutable.append(totoal)
        }
        return arrayMutable
    }
}