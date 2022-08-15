//
//  CalculateModule.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

// MARK: - Router
protocol CalculateRouterPresenterInterface: RouterPresenterInterface {}

// MARK: - Presenter
protocol CalculatePresenterRouterInterface: PresenterRouterInterface {}
protocol CalculatePresenterInteractorInterface: PresenterInteractorInterface {}
protocol CalculatePresenterViewInterface: PresenterViewInterface {}

// MARK: - Interactor
protocol CalculateInteractorPresenterInterface: InteractorPresenterInterface {}

final class CalculateModule: ModuleInterface {

    typealias View = CalculateController
    typealias Presenter = CalculatePresenter
    typealias Router = CalculateRouter
    typealias Interactor = CalculateInteractor

    static func build() -> View {

        @Injected(\.storyboard) var storyboard
        @Injected(\.navigation) var navigation

        let interactor = Interactor()
        let presenter = Presenter()
        let view = storyboard.instantiateViewController(ofType: View.self)
        let router = Router()
        router.navigationController = navigation

        Self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        return view
    }
}
