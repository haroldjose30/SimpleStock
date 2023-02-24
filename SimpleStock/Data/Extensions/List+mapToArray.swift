//
//  List+mapToArray.swift
//  SimpleStock
//
//  Created by Jose Harold on 23/02/2023.
//

import RealmSwift

extension List where Element == ProductLocalDTO {
    
    func mapToArray() -> [ProductLocalDTO] {
        
        Array(self)
    }
}

extension List where Element == String {
    
    func mapToArray() -> [String] {
        
        Array(self)
    }
}

