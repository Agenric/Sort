//
//  HeapSort.swift
//  Sort
//
//  Created by Agenric on 2017/6/7.
//  Copyright © 2017年 Agenric. All rights reserved.
//  堆排序

/*
 利用堆顶记录始终是最大值这一特性，每一轮取堆顶的元素放入有序区。类似选择排序每一轮选择一个最大值放入有序区。
 1、将初始待排序关键字序列（A[0], A[1], A[2] ... A[n]）构建成大顶堆，此堆为初始的无序区
 2、将堆顶元素A[0]与堆低元素A[n]交换，此时得到新的无序区（A[0], A[1], A[2] ... A[n-1]）和新的有序区A[n]
 3、交换后新的堆顶A[0]很有可能不满足大顶堆的要求，因此需要对当前的无序区（A[0], A[1], A[2] ... A[n-1]）重新执行构建大顶堆的操作
 
 重复执行第二、三步，直到有序区的个数为n-1个，则排序完成
 */

import Cocoa

class HeapSort: NSObject {
    public static func sort(inputArray: [Int]) -> [Int] {
        var array = inputArray
        DDLog(inputArray: array)
        buildMaxHeap(inputArray: &array, length: array.count)
        for i in (1...(array.count - 1)).reversed() {
            Util.swap(array: &array, a: i, b: 0)
            adjustHeap(inputArray: &array, i: 0, length: i)
        }
        return array
    }
    
    private static func buildMaxHeap(inputArray: inout [Int], length: Int) {
        for i in (0...(length / 2)).reversed() {
            adjustHeap(inputArray: &inputArray, i: i, length: length)
        }
    }
    
    private static func adjustHeap(inputArray: inout [Int], i: Int, length: Int) {
        let leftChild = 2 * i + 1
        let rightChild = 2 * i + 2
        var max = i
        if i < length / 2 {
            if leftChild < length && inputArray[max] < inputArray[leftChild] {
                max = leftChild
            }
            if rightChild < length && inputArray[max] < inputArray[rightChild] {
                max = rightChild
            }
            if max != i {
                Util.swap(array: &inputArray, a: max, b: i)
                DDLog(inputArray: inputArray)
                print(" ")
                adjustHeap(inputArray: &inputArray, i: max, length: length)
            }
            
        }
    }
    
    private static func DDLog(inputArray: [Int]) {
        // 深度
        let deep = Int(floorf(1 + log2(Float(inputArray.count))))
        var charLength = 0
        for i in 0..<inputArray.count {
            var str = String(inputArray[i])
            if str.characters.count > charLength {
                charLength = str.characters.count
            }
        }
        
        print("-----------------------start-----------------------")
        for row in 1...deep {
            // 计算第row行的border
            let border = Int(powf(2, Float(deep - row)) - 1) * charLength
            // 计算第row行的间距
            let margin = row == 0 ? 0 : Int(powf(2, Float(deep + 1 - row)) - 1) * charLength
            
            // 计算第row行共有几个数。2的row次方
            let count = Int(powf(2, Float(row - 1)))
            
            for i in 0..<count {
                if i == 0 {
                    for _ in 0..<border {
                        print(" ", terminator: "")
                    }
                    let str = String(format:"%.\(charLength)d", inputArray[count + i - 1])
                    print(str, terminator: "")
                } else if count + i <= inputArray.count {
                    for _ in 1...margin {
                        print(" ", terminator: "")
                    }
                    let str = String(format:"%.\(charLength)d", inputArray[count + i - 1])
                    print(str, terminator: "")
                } else {
                    break
                }
            }
            print("")
        }
        print("------------------------end------------------------")
    }
}
