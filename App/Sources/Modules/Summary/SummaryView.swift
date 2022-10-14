//
//  SummaryView.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import SwiftUI

struct SummaryView: View, ViewInterface {

    var presenter: SummaryPresenterViewInterface!

    var amount: Double = 0
    var code: String = ""
    var rate: String = ""

    private var successMessage: String {
        ~"SUCCESS_MESSAGE"
            .replacingOccurrences(of: "AMOUNT", with: String(amount))
            .replacingOccurrences(of: "CODE", with: code)
            .replacingOccurrences(of: "RATE", with: rate)
    }

    var body: some View {
        NavigationStack {
            Text(successMessage).toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(~"DONE", action: presenter.done)
                }
            }
        }
    }
}
