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

    private var cancelBag = CancelBag()

    // UI
    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var percedesLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
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

        guard let pair = pair, let amount = amount else {
            return
        }

        // Labels
        baseLabel.text = "\(amount) \(pair.base)"
        percedesLabel.text = ~"PRECEDES"
        targetLabel.text = "\(pair.resultString) \(pair.target)"

        presenter.runCountPublisher
            .receive(on: DispatchQueue.main)
            .sink { runCount in
                let text = ~"SEC_LEFT"
                self.timerLabel.text = text.replacingOccurrences(of: "SEC", with: "\(runCount)")
            }
            .store(in: cancelBag)

        buttonNext.setTitle(~"CONVERT", for: .normal)
        buttonNext.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.next(pair: pair)
        }), for: .touchUpInside)
    }
}
