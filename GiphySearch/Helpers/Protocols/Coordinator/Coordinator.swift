//
//  Coordinator.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 31/1/22.
//

import UIKit

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func childDidFinish(_ child: Coordinator)

}

extension Coordinator {

    var unwrappedParentCoordinator: Coordinator {
        return parentCoordinator ?? self
    }

    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }

    func childDidFinish() {
        childCoordinators.removeLast()
    }

}
