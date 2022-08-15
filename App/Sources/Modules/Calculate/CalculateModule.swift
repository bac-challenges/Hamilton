//
//  CalculateModule.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit
import Combine

// MARK: - Router
protocol CalculateRouterPresenterInterface: RouterPresenterInterface {
    func next()
}

// MARK: - Presenter
protocol CalculatePresenterRouterInterface: PresenterRouterInterface {}
protocol CalculatePresenterInteractorInterface: PresenterInteractorInterface {}
protocol CalculatePresenterViewInterface: PresenterViewInterface {
    var itemsPublisher: Published<[Currency]>.Publisher { get }

    func getCurrencyList()
    func next()
}

// MARK: - Interactor
protocol CalculateInteractorPresenterInterface: InteractorPresenterInterface {
    func getCurrencyList() -> AnyPublisher<[Currency], Error>
}

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
