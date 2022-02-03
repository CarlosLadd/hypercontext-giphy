//
//  DataSourceAssembly.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import Foundation
import Swinject

final class DataSourceAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(RemoteDataSourceProtocol.self) { _ in
            
            return RemoteDataSource()
            
        }
        
    }
    
}
