//
//  PageState.swift
//  SimpleStock
//
//  Created by Jose Harold on 23/02/2023.
//

enum PageState<T> {
    case empty
    case loading
    case failure(message: String)
    case success(data: T )
}
