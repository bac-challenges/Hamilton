//
//  SummaryModule.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

// MARK: - Router
protocol SummaryRouterPresenterInterface: RouterPresenterInterface {}

// MARK: - Presenter
protocol SummaryPresenterRouterInterface: PresenterRouterInterface {}
protocol SummaryPresenterInteractorInterface: PresenterInteractorInterface {}
protocol SummaryPresenterViewInterface: PresenterViewInterface {}

// MARK: - Interactor
protocol SummaryInteractorPresenterInterface: InteractorPresenterInterface {}

final class SummaryModule: ModuleInterface {

    typealias View = SummaryController
    typealias Presenter = SummaryPresenter
    typealias Router = SummaryRouter
    typealias Interactor = SummaryInteractor

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
