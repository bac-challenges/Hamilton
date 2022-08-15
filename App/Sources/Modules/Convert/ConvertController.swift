//
//  ConvertController.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

final class ConvertController: UIViewController, ViewInterface {

    // VIPER
    var presenter: ConvertPresenterViewInterface!

    var pair: Pair?
    var amount: Double?

    // UI
    @IBOutlet weak var buttonNext: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        wireView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.startTimer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.stopTimer()
    }
}

// MARK: - UI
private extension ConvertController {
    func wireView() {

        guard let pair = pair else {
            return
        }

        buttonNext.setTitle(~"CONVERT", for: .normal)
        buttonNext.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.next(pair: pair)
        }), for: .touchUpInside)
    }
}
