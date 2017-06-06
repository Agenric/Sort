//
//  InsertionSort.swift
//  Sort
//
//  Created by Agenric on 2017/6/5.
//  Copyright © 2017年 Agenric. All rights reserved.
//  直接插入排序

import Cocoa

class InsertionSort: NSObject {
    
    // 每一趟操作就是在将一个元素插入到一个之前已经排好的有序列表中，从而得到一个新的有序列表，知道最后一个元素也插入到他之前的有序列表中，则排序结束
    static func sort(inputArray: [Int]) -> [Int] {
        var array = inputArray
        
        for i in 1..<array.count {
            let tmp = array[i]
            var j = i-1
            
            while j >= 0 && tmp < array[j] {
                array[j + 1] = array[j]
                j -= 1
            }
            array[j + 1] = tmp
        }
        
        return array;
    }
    
    // 此方法虽然节省了一个额外的内存地址，但是时间复杂度却成指数级增长。
    static func sort1(inputArray: [Int]) -> [Int] {
        var array = inputArray
        
        for i in 1..<array.count {
            for j in (0..<i).reversed() {
                if array[j + 1] < array[j] {
                    Util.swap(array: &array, a: j, b: j + 1)
                } else {
                    break
                }
            }
        }
        
        return array;
    }
}
