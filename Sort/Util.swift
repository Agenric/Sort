//
//  Util.swift
//  Sort
//
//  Created by Agenric on 2017/6/3.
//  Copyright © 2017年 Agenric. All rights reserved.
//

import Cocoa

class Util: NSObject {
    static func swap(array:inout [Int], a: Int, b: Int) -> Void {
                
        if a >= 0 && a < array.count && b >= 0 && b < array.count && a != b {
            array[a] = array[a] + array[b]
            array[b] = array[a] - array[b]
            array[a] = array[a] - array[b]
        }
    }
}
