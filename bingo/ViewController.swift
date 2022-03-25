//
//  ViewController.swift
//  bingo
//
//  Created by 上別縄祐也 on 2022/03/16.
//

import SwiftUI

class ViewController : ObservableObject{
    @Published var nums:[Int] = [1]
    @Published var draws: [Int] = [0]
    init(){
        for i in (2...75){
            nums.append(i)
        }
        nums.shuffle()
    }
    
    func start() -> [Int]{
        if nums.isEmpty{
            return [-1]
        }
        if draws[0] == 0 {
            draws.removeAll()
        }
        draws.append(nums.removeLast())
        return draws
    }
    
    func reset() -> [Int]{
        draws = [0]
        nums = [1]
        for i in (2...75){
            nums.append(i)
        }
        nums.shuffle()
        return draws
    }
    
}
