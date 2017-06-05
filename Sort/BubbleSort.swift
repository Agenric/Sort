//
//  BubbleSort.swift
//  Sort
//
//  Created by Agenric on 2017/6/5.
//  Copyright © 2017年 Agenric. All rights reserved.
//  冒泡排序

import Cocoa

class BubbleSort: NSObject {
    static func sort(inputArray: [Int]) -> Array<Int> {
        var array = inputArray
        
        for i in 0..<array.count {
            for j in i..<array.count {
                if array[i] > array[j] {
                    Util.swap(array: &array, a: i, b: j)
                }
            }
        }
        
        return array;
    }
}
