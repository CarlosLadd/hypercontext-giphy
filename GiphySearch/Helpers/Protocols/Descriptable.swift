//
//  Descriptable.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

protocol Descriptable {

    var description: String { get }

}

protocol ErrorDescriptable: Descriptable { }
