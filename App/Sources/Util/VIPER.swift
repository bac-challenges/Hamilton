//
//  VIPERModule.swift
//  ayoba-ios
//
//  Created by emile on 25/06/2020.
//

import UIKit

// MARK: - VIPER
public protocol RouterInterface: RouterPresenterInterface {
    associatedtype PresenterRouter

    var presenter: PresenterRouter! { get set }
}

public protocol InteractorInterface: InteractorPresenterInterface {
    associatedtype PresenterInteractor

    var presenter: PresenterInteractor! { get set }
}

public protocol PresenterInterface: PresenterRouterInterface, PresenterInteractorInterface, PresenterViewInterface {
    associatedtype RouterPresenter
    associatedtype InteractorPresenter

    var router: RouterPresenter! { get set }
    var interactor: InteractorPresenter! { get set }
}

public protocol ViewInterface: ViewPresenterInterface {
    associatedtype PresenterView

    var presenter: PresenterView! { get set }
}

// MARK: - "i/o" transitions
public protocol RouterPresenterInterface: AnyObject {}
public protocol InteractorPresenterInterface: AnyObject {}
public protocol PresenterRouterInterface: AnyObject {}
public protocol PresenterInteractorInterface: AnyObject {}
public protocol PresenterViewInterface: AnyObject {}
public protocol ViewPresenterInterface {}

// MARK: - Module
public protocol ModuleInterface {

    associatedtype View where View: ViewInterface
    associatedtype Presenter where Presenter: PresenterInterface
    associatedtype Router where Router: RouterInterface
    associatedtype Interactor where Interactor: InteractorInterface

    static func assemble(presenter: Presenter, router: Router, interactor: Interactor)
}

// swiftlint:disable all
public extension ModuleInterface {
    static func assemble(presenter: Presenter, router: Router, interactor: Interactor) {
        interactor.presenter = (presenter as! Self.Interactor.PresenterInteractor)
        presenter.interactor = (interactor as! Self.Presenter.InteractorPresenter)
        presenter.router = (router as! Self.Presenter.RouterPresenter)
        router.presenter = (presenter as! Self.Router.PresenterRouter)
    }
}
