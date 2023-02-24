//
//  Array+mapToList.swift
//  SimpleStock
//
//  Created by Jose Harold on 23/02/2023.
//

import RealmSwift

extension Array where Element == String {
    
    func mapToList() -> List<String> {
        
        return SimpleStock.mapToList(array: self)
    }
}

extension Array where Element == ProductLocalDTO {
    
    func mapToList() -> List<ProductLocalDTO> {
        
        return SimpleStock.mapToList(array: self)
    }
}

private func mapToList<T>(array: [T]) -> List<T> {
    
    let list = List<T>()
    list.append(objectsIn: array)
    return list
}




