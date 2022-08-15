//
//  ConvertInteractor.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import Combine

final class ConvertInteractor: InteractorInterface {
    weak var presenter: ConvertPresenterInteractorInterface!
}

extension ConvertInteractor: ConvertInteractorPresenterInterface {}
