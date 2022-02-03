//
//  ProviderAssembly.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import Foundation
import Swinject

final class ProviderAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(UseCaseProviderProtocol.self) { resolver in
            UseCaseProvider(remoteDataSource: resolver.resolve(RemoteDataSourceProtocol.self)!)
        }
        
    }
    
}
