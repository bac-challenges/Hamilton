//
//  CalculateController.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit
import Combine

final class CalculateController: UIViewController, ViewInterface {

    // VIPER
    var presenter: CalculatePresenterViewInterface!

    // UI
    @IBOutlet weak var buttonBase: UIButton!
    @IBOutlet weak var buttonTarget: UIButton!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var buttonNext: UIButton!

    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.width-20, height: 216))
        picker.delegate = self
        return picker
    }()

    private lazy var actionSheet: UIAlertController = {
        UIAlertController(title: ~"SELECT_CURRENCY", message: nil, preferredStyle: .actionSheet)
    }()

    //
    private var items = [Currency(code: ~"NOT_SELECTED", name: ~"NO_SELECTION")]
    private var cancelBag = CancelBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        wireView()
        bind()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        restetView()
        presenter.getCurrencyList()
    }
}

// MARK: - Actions
private extension CalculateController {

    //
    private func showPicker(target: CalculatePresenter.CurrencyTarget) {
        presenter.target = target
        pickerView.selectRow(0, inComponent: 0, animated: false)
        present(actionSheet, animated: true)
    }

    // Currency Selector
    private func selectCurrency(_ currency: Currency) {
        presenter.setCurrency(currency.code)
        updateView()
    }

    // AmountField
    @objc func textFieldDidChange(textField: UITextField) {
        if let text = textField.text, let amount = Double(text) {
            presenter.amount = amount
        }

        if let amountString = textField.text?.currencyInputFormatting(), let amount = Double(amountString) {
            textField.text = amountString
            presenter.amount = amount
        }

        updateView()
    }

    //
    private func updateView() {
        amountField.isEnabled = presenter.isTextFieldAvaliable
        buttonNext.isEnabled = amountField.isValid
    }

    private func restetView() {
        presenter.target = .base
        presenter.setCurrency(~"NOT_SELECTED")
        presenter.target = .target
        presenter.setCurrency(~"NOT_SELECTED")
        amountField.text = ""

        updateView()
    }
}

// MARK: - UI
private extension CalculateController {
    func wireView() {

        // AmountField
        amountField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        amountField.isEnabled = false

        // AlertPickerView
        actionSheet.view.addSubview(pickerView)
        actionSheet.view.anchor(paddingBottom: 0, height: 290)
        actionSheet.addAction(UIAlertAction(title: ~"DONE", style: .default))

        // Buttons
        buttonBase.addAction(UIAction(handler: { [weak self] _ in
            self?.showPicker(target: .base)
        }), for: .touchUpInside)

        buttonTarget.addAction(UIAction(handler: { [weak self] _ in
            self?.showPicker(target: .target)
        }), for: .touchUpInside)

        buttonNext.setTitle(~"CALCULATE", for: .normal)
        buttonNext.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.next()
        }), for: .touchUpInside)
    }
}

// MARK: - Bindings
private extension CalculateController {
    func bind() {

        // Curencies
        presenter.itemsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] items in
                self?.items.append(contentsOf: items)
            }
            .store(in: cancelBag)

        //
        presenter.baseCurrencyCodePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] code in
                self?.buttonBase.setTitle(code, for: .normal)
                self?.updateView()
            }
            .store(in: cancelBag)

        //
        presenter.targetCurrencyCodePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] code in
                self?.buttonTarget.setTitle(code, for: .normal)
                self?.updateView()
            }
            .store(in: cancelBag)
    }
}

// MARK: - UIPickerViewDataSource
extension CalculateController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        items.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectCurrency(items[row])
    }
}

// MARK: - UIPickerViewDataSource
extension CalculateController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        row == 0 ? items[row].name:items[row].description
    }
}
