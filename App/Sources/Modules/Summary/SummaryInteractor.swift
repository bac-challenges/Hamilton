//
//  SummaryInteractor.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import Combine

final class SummaryInteractor: InteractorInterface {
    
    // VIPER
    weak var presenter: SummaryPresenterInteractorInterface!
}

extension SummaryInteractor: SummaryInteractorPresenterInterface {}
