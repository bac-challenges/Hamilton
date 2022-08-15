//
//  CalculateModuleViewModel.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//  
//

import Combine

final class CalculateModuleViewModel: ObservableObject {

    enum ViewState {
        case loading, success, failed
    }

    @Published var state: ViewState = .loading

    @Published var name: String = "CalculateModule"
}
