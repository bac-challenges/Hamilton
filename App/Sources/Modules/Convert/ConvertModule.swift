//
//  ConvertModule.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

// MARK: - Router
protocol ConvertRouterPresenterInterface: RouterPresenterInterface {}

// MARK: - Presenter
protocol ConvertPresenterRouterInterface: PresenterRouterInterface {}
protocol ConvertPresenterInteractorInterface: PresenterInteractorInterface {}
protocol ConvertPresenterViewInterface: PresenterViewInterface {}

// MARK: - Interactor
protocol ConvertInteractorPresenterInterface: InteractorPresenterInterface {}

final class ConvertModule: ModuleInterface {

    typealias View = ConvertController
    typealias Presenter = ConvertPresenter
    typealias Router = ConvertRouter
    typealias Interactor = ConvertInteractor

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
