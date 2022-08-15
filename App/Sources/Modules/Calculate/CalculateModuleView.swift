//
//  CalculateModuleView.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//  
//

import SwiftUI

struct CalculateModuleView: ViewInterface, View {

    var presenter: CalculateModulePresenterViewInterface!

    @ObservedObject
    var viewModel: CalculateModuleViewModel

    var body: some View {
        Text("\(viewModel.name)")
    }
}
