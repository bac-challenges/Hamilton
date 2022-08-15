//
//  CalculateModuleInteractor.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//  
//

import SwiftUI

final class CalculateModuleInteractor: InteractorInterface {
    weak var presenter: CalculateModulePresenterInteractorInterface!
}

extension CalculateModuleInteractor: CalculateModuleInteractorPresenterInterface {}
