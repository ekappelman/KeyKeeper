//
//  PasswordGenerator.swift
//  Password Gen
//
//  Created by Erik Kappelman on 9/3/15.
//  Copyright (c) 2015 duplovici. All rights reserved.
//

import Foundation

class PasswordGenerator {
    func passwordGenerator(uppercase: Bool, number: Bool, symbol: Bool, len: Int) -> NSString {

        var letters: NSString = "abcdefghijklmnopqrstuvwxyz"
        
        if(uppercase){
            letters = (letters as String)+"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        }
        if(number){
            letters = (letters as String)+"1234567890"
        }
        if(symbol){
            letters = (letters as String)+"!@#$%^&*"
        }
        
        var randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        return randomString
        
    }
}
