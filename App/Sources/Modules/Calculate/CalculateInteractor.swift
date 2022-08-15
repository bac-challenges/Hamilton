//
//  CalculateInteractor.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import Combine

final class CalculateInteractor: InteractorInterface {
    weak var presenter: CalculatePresenterInteractorInterface!
}

extension CalculateInteractor: CalculateInteractorPresenterInterface {}
