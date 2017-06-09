//
//  Array+Util.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

extension Array {

    func object(at index: Int) -> Element? {
        
        if case 0..<count = index {
            
            return self[index]
        } else {
            
            return nil
        }
    }
    
    func by(adding element: Element) -> [Element]  {
        
        var newArray = self
        newArray.append(element)
        
        return newArray
    }
    
    func indexOfElement(where closure: ((Element) -> (Bool))) -> Int? {
        
        for (i, element) in self.enumerated() {
            
            if closure(element) {
                return i
            }
        }
        
        return nil
    }
    
}

extension Array where Element : Equatable {
    
    func `where`(lambda: ((Element) -> (Bool))) -> Element? {
        
        return self.filter(lambda).first
    }
    
    func by(removing element: Element) -> [Element] {
        
        var newArray = self
        _ = newArray.remove(element)
        
        return newArray
    }
    
    mutating func remove(_ element: Element) -> Element? {
        
        if let index = self.index(of: element) {
            
            let element = self.remove(at: index)
            return element
        } else {
            
            return nil
        }
    }
}
