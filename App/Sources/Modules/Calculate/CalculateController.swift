//
//  CalculateController.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

final class CalculateController: UIViewController, ViewInterface {

    // VIPER
    var presenter: CalculatePresenterViewInterface!

    // UI
    @IBOutlet weak var buttonNext: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        wireView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getCurrencyList()
    }
}

// MARK: - UI
private extension CalculateController {
    func wireView() {
        buttonNext.setTitle(~"CALCULATE", for: .normal)
        buttonNext.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.next()
        }), for: .touchUpInside)
    }
}
