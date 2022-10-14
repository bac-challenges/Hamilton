//
//  ConvertModule.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

// MARK: - Router
protocol ConvertRouterPresenterInterface: RouterPresenterInterface {
    func next(amount: Double, code: String, rate: String)
    func back()
}

// MARK: - Presenter
protocol ConvertPresenterRouterInterface: PresenterRouterInterface {}
protocol ConvertPresenterInteractorInterface: PresenterInteractorInterface {}
protocol ConvertPresenterViewInterface: PresenterViewInterface {
    var runCountPublisher: Published<Int>.Publisher { get }

    func startTimer()
    func stopTimer()
    func next(pair: Pair, amount: Double)
}

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
        var view = storyboard.instantiateViewController(ofType: View.self)
        view.presenter = presenter
        let router = Router()
        router.navigationController = navigation

        Self.assemble(presenter: presenter, router: router, interactor: interactor)

        return view
    }
}
