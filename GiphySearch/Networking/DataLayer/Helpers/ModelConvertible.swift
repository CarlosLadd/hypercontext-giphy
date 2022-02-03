//
//  ModelConvertible.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

protocol ModelConvertible {

    associatedtype Model

    func asModel() -> Model

}
