//
//  ViewAssembly.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import Foundation
import Swinject

final class ViewAssembly: Assembly {
    
    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            SearchAssembly()
        ]
        
        assemblies.forEach { $0.assemble(container: container) }
    }
    
}
