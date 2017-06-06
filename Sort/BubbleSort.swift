//
//  BubbleSort.swift
//  Sort
//
//  Created by Agenric on 2017/6/5.
//  Copyright © 2017年 Agenric. All rights reserved.
//  冒泡排序

import Cocoa

class BubbleSort: NSObject {
    
    // 两两比较，相邻两个如果左边比右边的大则交换顺序，每趟循环之后，会把未排序元素中最大的放到最右
    static func sort(inputArray: [Int]) -> Array<Int> {
        var array = inputArray
        
        for _ in 0..<array.count {
            for j in 1..<array.count {
                if array[j - 1] > array[j] {
                    Util.swap(array: &array, a: j - 1, b: j)
                }
            }
        }
        
        return array;
    }
    
    // 设置标志位，标示当前这一趟比较是否交换过位置，如果没有交换过，证明在上一趟对比之后，已经排好序了
    static func sort1(inputArray: [Int]) -> Array<Int> {
        var array = inputArray

        // 1、思路一样实现不一样而已，只能选其一
        for _ in 0..<array.count {
            var flag = true
            
            for j in 1..<array.count {
                if array[j - 1] > array[j] {
                    Util.swap(array: &array, a: j - 1, b: j)
                    flag = false
                }
            }
            if flag {
                break
            }
        }
        
        // 2、
//        var flag = true
//        while flag {
//            flag = false
//            for j in 1..<array.count {
//                if array[j - 1] > array[j] {
//                    Util.swap(array: &array, a: j - 1, b: j)
//                    flag = true
//                }
//            }
//        }
        
        return array;
    }
    
    // 设置标志位，标示当前这一趟最后作交换的位置，下一趟该位置后的元素可以不用参与比较，因为此趟之前已经没有交换过证明已经排序完成了
    static func sort2(inputArray: [Int]) -> Array<Int> {
        var array = inputArray
        
        var flag = array.count
        while flag > 0 {
            let count = flag
            flag = 0
            for j in 1..<count {
                if array[j - 1] > array[j] {
                    Util.swap(array: &array, a: j - 1, b: j)
                    flag = j
                }
            }
        }
        
        return array;
    }
    
    static func sort3(inputArray: [Int]) -> Array<Int> {
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
