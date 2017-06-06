//
//  ShellSort.swift
//  Sort
//
//  Created by Agenric on 2017/6/6.
//  Copyright © 2017年 Agenric. All rights reserved.
//  希尔排序-可称为插入排序的一种
//  https://zh.wikipedia.org/wiki/%E5%B8%8C%E5%B0%94%E6%8E%92%E5%BA%8F

import Cocoa

class ShellSort: NSObject {
    
    // 先对整个待排序列使用一个固定的“增量”，分成若干个子序列。然后每次对子序列进行直接插入排序，结束后，缩小这个“增量”。重复执行。直至“增量”为1，排序完成。
    static func sort(inputArray: [Int]) -> [Int] {
        var array = inputArray
        
        var step = array.count / 2
        
        while step > 0 {
            for i in step..<array.count {
                let tmp = array[i]
                var j = i
                
                while j >= step && array[j - step] > tmp {
                    array[j] = array[j - step]
                    j -= step
                }
                array[j] = tmp
            }
            step = step / 2
        }
        
        return array
    }
}
