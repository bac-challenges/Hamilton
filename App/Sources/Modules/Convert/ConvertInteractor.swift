//
//  ConvertInteractor.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import Combine

final class ConvertInteractor: InteractorInterface {

    // VIPER
    weak var presenter: ConvertPresenterInteractorInterface!
}

extension ConvertInteractor: ConvertInteractorPresenterInterface {}
