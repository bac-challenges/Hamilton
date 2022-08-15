//
//  CalculateModuleModule.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//  
//

import SwiftUI

// MARK: - Router
protocol CalculateModuleRouterPresenterInterface: RouterPresenterInterface {}

// MARK: - Presenter
protocol CalculateModulePresenterRouterInterface: PresenterRouterInterface {}
protocol CalculateModulePresenterInteractorInterface: PresenterInteractorInterface {}
protocol CalculateModulePresenterViewInterface: PresenterViewInterface {}

// MARK: - Interactor
protocol CalculateModuleInteractorPresenterInterface: InteractorPresenterInterface {}

final class CalculateModuleModule: ModuleInterface {

    typealias View = CalculateModuleView
    typealias Presenter = CalculateModulePresenter
    typealias Router = CalculateModuleRouter
    typealias Interactor = CalculateModuleInteractor

    static func build() -> View {
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()

        let viewModel = CalculateModuleViewModel()
        let view = View(presenter: presenter, viewModel: viewModel)
        presenter.viewModel = viewModel

        Self.assemble(presenter: presenter, router: router, interactor: interactor)

        return view
    }
}
