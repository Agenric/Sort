//
//  QuickSort.swift
//  Sort
//
//  Created by Agenric on 2017/6/5.
//  Copyright © 2017年 Agenric. All rights reserved.
//  快速排序

import Cocoa

class QuickSort: NSObject {
    static func sort(array:inout [Int], low: Int, high: Int) {
        if high <= low {
            return
        }
        var left = low
        var right = high
        
        let pivot = array[right]
        
        while left < right {
            while left < right && array[left] <= pivot {
                left += 1
            }
            if left < right {
                Util.swap(array: &array, a: left, b: right)
                right -= 1
            }
            
            while left < right && array[right] >= pivot {
                right -= 1
            }
            if left < right {
                Util.swap(array: &array, a: left, b: right)
                left += 1
            }
        }
        
        if left > low {
            QuickSort.sort(array: &array, low: low, high: left - 1)
        }
        
        if right < high {
            QuickSort.sort(array: &array, low: left + 1, high: high)
        }
    }
    
    static func sort1(array:inout [Int], low: Int, high: Int) {
        var left = low + 1
        var right = high
        
        let pivot = array[low]
        if right <= left {
            return
        }
        
        while true {
            while array[right] > pivot {
                right -= 1
            }
            while left < right && array[left] < pivot {
                left += 1
            }
            if left >= right {
                break
            }
            
            Util.swap(array: &array, a: left, b: right)

            if array[left] == pivot {
                right -= 1
            } else {
                left += 1
            }
        }
        
        Util.swap(array: &array, a: low, b: right)
        
        if left - 1  > low {
            QuickSort.sort(array: &array, low: low, high: left - 1)
        }
        
        if right + 1 < high {
            QuickSort.sort(array: &array, low: right + 1, high: high)
        }
    }
}
