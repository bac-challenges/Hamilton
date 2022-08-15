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

    // UI
    @IBOutlet weak var buttonNext: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        wireView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK: - UI
private extension ConvertController {
    func wireView() {
        buttonNext.setTitle(~"CONVERT", for: .normal)
        buttonNext.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.next()
        }), for: .touchUpInside)
    }
}
