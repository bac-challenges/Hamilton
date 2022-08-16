//
//  SummaryController.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

final class SummaryController: UIViewController, ViewInterface {

    // VIPER
    var presenter: SummaryPresenterViewInterface!

    @IBOutlet weak var label: UILabel!

    var amount: Double = 0.0
    var code: String = ""
    var rate: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        wireView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK: - Actions
private extension SummaryController {
    @objc func done() {
        presenter.done()
    }
}

// MARK: - UI
extension SummaryController {
    func wireView() {

        // NavBar
        let done = UIBarButtonItem(title: ~"DONE", style: .plain, target: self, action: #selector(done))
        navigationItem.rightBarButtonItems = [done]
        navigationItem.setHidesBackButton(true, animated: true)

        // Label
        let successMessage = ~"SUCCESS_MESSAGE"
        label.text = successMessage
            .replacingOccurrences(of: "AMOUNT", with: String(amount))
            .replacingOccurrences(of: "CODE", with: code)
            .replacingOccurrences(of: "RATE", with: rate)
    }
}
