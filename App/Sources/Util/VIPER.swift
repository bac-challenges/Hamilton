//
//  VIPERModule.swift
//  ayoba-ios
//
//  Created by emile on 25/06/2020.
//  Copyright © 2020 xpertai. All rights reserved.
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

public protocol PresenterInterface: PresenterRouterInterface & PresenterInteractorInterface & PresenterViewInterface {
	associatedtype RouterPresenter
	associatedtype InteractorPresenter
	/*associatedtype ViewPresenter*/

	var router: RouterPresenter! { get set }
	var interactor: InteractorPresenter! { get set }
	/*var view: ViewPresenter! { get set }*/
}

public protocol ViewInterface/*: ViewPresenterInterface*/ {
	associatedtype PresenterView

	var presenter: PresenterView! { get set }
}

// MARK: - "i/o" transitions
public protocol RouterPresenterInterface: class {}
public protocol InteractorPresenterInterface: class {}
public protocol PresenterRouterInterface: class {}
public protocol PresenterInteractorInterface: class {}
public protocol PresenterViewInterface: class {}
/*
public protocol ViewPresenterInterface: class {

}
*/

// MARK: - Module
public protocol ModuleInterface {

	associatedtype View where View: ViewInterface
	associatedtype Presenter where Presenter: PresenterInterface
	associatedtype Router where Router: RouterInterface
	associatedtype Interactor where Interactor: InteractorInterface

	static func assemble(/*view: View, */presenter: Presenter, router: Router, interactor: Interactor)
}

public extension ModuleInterface {

	static func assemble(/*view: View, */presenter: Presenter, router: Router, interactor: Interactor) {
		/*
		view.presenter = (presenter as! Self.View.PresenterView)
		
		presenter.view = (view as! Self.Presenter.ViewPresenter)
		*/
		presenter.interactor = (interactor as! Self.Presenter.InteractorPresenter)
        presenter.router = (router as! Self.Presenter.RouterPresenter)

		interactor.presenter = (presenter as! Self.Interactor.PresenterInteractor)

		router.presenter = (presenter as! Self.Router.PresenterRouter)
	}
}
