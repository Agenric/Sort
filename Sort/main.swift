//
//  main.swift
//  Sort
//
//  Created by Agenric on 2017/6/3.
//  Copyright © 2017年 Agenric. All rights reserved.
//

import Foundation

var array: [Int] = []

for _ in 0..<21 {
    array.append(Int(arc4random_uniform(100)))
}

func sortBlock(name: String, array: [Int], block: ([Int]) -> ([Int])) {
    print("原始数组：\(array) \n开始执行：\(name)")
    let startDate = Date()
    let result = block(array)
    print("排序结果：\(result) \n执行时长: \(-startDate.timeIntervalSinceNow)\n")
}

//sortBlock(name: "冒泡排序", array: array) { (inputArray) -> ([Int]) in
//    return BubbleSort.sort(inputArray: inputArray)
//}
//
//sortBlock(name: "冒泡排序1", array: array) { (inputArray) -> ([Int]) in
//    return BubbleSort.sort1(inputArray: inputArray)
//}
//
//sortBlock(name: "冒泡排序2", array: array) { (inputArray) -> ([Int]) in
//    return BubbleSort.sort2(inputArray: inputArray)
//}

sortBlock(name: "直接插入排序", array: array) { (inputArray) -> ([Int]) in
    return InsertionSort.sort(inputArray: inputArray)
}
//
//sortBlock(name: "直接插入排序1", array: array) { (inputArray) -> ([Int]) in
//    return InsertionSort.sort1(inputArray: inputArray)
//}
//
//sortBlock(name: "快速排序", array: array) { (inputArray) -> ([Int]) in
//    var input = inputArray
//    QuickSort.sort(array: &input, low: 0, high: input.count - 1)
//    return input
//}
//
//sortBlock(name: "快速排序1", array: array) { (inputArray) -> ([Int]) in
//    var input = inputArray
//    QuickSort.sort1(array: &input, low: 0, high: input.count - 1)
//    return input
//}

//sortBlock(name: "希尔排序", array: array) { (inputArray) -> ([Int]) in
//    return ShellSort.sort(inputArray: inputArray)
//}

sortBlock(name: "归并排序", array: array) { (inputArray) -> ([Int]) in
    return MergeSort.sort(inputArray: inputArray)
}

sortBlock(name: "堆排序", array: array) { (inputArray) -> ([Int]) in
    return HeapSort.sort(inputArray: inputArray)
}
