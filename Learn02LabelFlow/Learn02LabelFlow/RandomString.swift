//
//  RandomString.swift
//  Learn02LabelFlow
//
//  Created by Liu Wei on 16/3/8.
//  Copyright © 2016年 Liu Wei. All rights reserved.
//

import Foundation

/// 随机字符串生成
class RandomString {
    let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    /**
     生成随机字符串,
     
     - parameter length: 生成的字符串的长度
     
     - returns: 随机生成的字符串
     */
    func getRandomStringOfLength(length: Int) -> String {
        var ranStr = ""
        for _ in 0..<length {
            let index = Int(arc4random_uniform(UInt32(characters.characters.count)))
            ranStr.append(characters[characters.startIndex.advancedBy(index)])
        }
        return ranStr
        
    }
    
    
    private init() {
        
    }
    static let sharedInstance = RandomString()
}