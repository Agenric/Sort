//
//  MergeSort.swift
//  Sort
//
//  Created by Agenric on 2017/6/6.
//  Copyright © 2017年 Agenric. All rights reserved.
//  归并排序
//  https://zh.wikipedia.org/wiki/%E5%BD%92%E5%B9%B6%E6%8E%92%E5%BA%8F

import Cocoa

class MergeSort: NSObject {
    static func sort(inputArray: [Int]) -> [Int] {
        var array = inputArray
        var helperArray = Array.init(repeating: 0, count: array.count)
//        mergeSort(inputArray: &array, helperArray: &helperArray, low: 0, high: array.count - 1)
        mergeSort(inputArray: &array, helperArray: &helperArray, length: array.count)
        return array
    }
    
    private static func mergeSort(inputArray: inout [Int], helperArray: inout [Int], length: Int) {
        var len = 1
        
        while len < length {
            let step = len
            len = 2 * step
            var i = 0
            while i + len < length {
                merge(inputArray: &inputArray, helperArray: &helperArray, low: i, middle: i + step - 1, high: i + len - 1)
                i = i + len
            }
            if i + step < length {
                merge(inputArray: &inputArray, helperArray: &helperArray, low: i, middle: i + step - 1, high: length - 1)
            }
        }
    }
    
    private static func mergeSort(inputArray: inout [Int], helperArray: inout [Int], low: Int, high: Int) {
        if low >= high {
            return
        }
        
        let middle = (high - low) / 2 + low
        
        mergeSort(inputArray: &inputArray, helperArray: &helperArray, low: low, high: middle)
        mergeSort(inputArray: &inputArray, helperArray: &helperArray, low: middle + 1, high: high)
        merge(inputArray: &inputArray, helperArray: &helperArray, low: low, middle: middle, high: high)
    }
    
    private static func merge(inputArray: inout [Int], helperArray: inout [Int], low: Int, middle: Int, high: Int) {
        for i in low...high {
            helperArray[i] = inputArray[i]
        }
        
        var helperLeft = low
        var helperRight = middle + 1
        var current = low
        
        while helperLeft <= middle && helperRight <= high {
            if helperArray[helperLeft] <= helperArray[helperRight] {
                inputArray[current] = helperArray[helperLeft]
                helperLeft += 1
            } else {
                inputArray[current] = helperArray[helperRight]
                helperRight += 1
            }
            current += 1
        }
        
        if middle - helperLeft < 0 {
            return
        }
        
        for i in 0...middle - helperLeft {
            inputArray[current + i] = helperArray[helperLeft + i]
        }
    }
}
