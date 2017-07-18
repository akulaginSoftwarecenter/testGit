//
//  Parser+KeyConversion.swift
//  SwiftAPIWrapper
//
//  Created by Alexander Kozin on 04.04.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

/** KeyConversion Extends Parser
    Convert keys from api representation to local
    And vise versa
*/
extension Parser {

    static func classNameFromBackendKey(_ key: String) -> String {
        return keyFromBackendKey(key, capitlizeFirst: true)
    }
    
    static func propertyFromBackendKey(_ key: String) -> String {
        return keyFromBackendKey(key, capitlizeFirst: false)
    }

    static func keyFromBackendKey(_ key: String, capitlizeFirst: Bool) -> String {
        var resultKey = ""

        let characters = key.unicodeScalars

        var shouldCapitlize = capitlizeFirst

        let snake = UnicodeScalar("_")

        for var char: UnicodeScalar in characters {
            if char == snake {
                shouldCapitlize = true
            } else {
                if (shouldCapitlize) {
                    char = UnicodeScalar(UInt32(toupper(Int32(char.value))))!
                    shouldCapitlize = false
                }

                resultKey.append(Character(char))
            }

        }

        return resultKey
    }


//    NSString *propertyName = self;
//
//    NSUInteger len = [propertyName length];
//    unichar bufferForIteration[len];
//    unichar resultBuffer[len];
//
//    [self getCharacters:bufferForIteration range:NSMakeRange(0, len)];
//
//    BOOL shouldCapitalize = capitalizeFirstLetter;
//
//    NSUInteger j = 0;
//    for(NSUInteger i = 0; i < len; ++i) {
//    char current = bufferForIteration[i];
//    if (current == '_') {
//    shouldCapitalize = YES;
//    } else {
//    if (shouldCapitalize) {
//    current = toupper(current);
//    shouldCapitalize = NO;
//    }
//
//    resultBuffer[j] = current;
//    j++;
//    }
//    }
//
//    propertyName = [[NSString alloc] initWithCharacters:resultBuffer length:j];
//
//    return propertyName;
//    }



    static func backendKeyFromPropertyName(_ key: String) -> String {
        return keyFromBackendKey(key, capitlizeFirst: true)
    }

    static func backendKeyFromClassName(_ key: String) -> String {
        return keyFromBackendKey(key, capitlizeFirst: true)
    }
}
