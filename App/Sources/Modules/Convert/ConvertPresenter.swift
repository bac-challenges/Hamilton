//
//  ConvertPresenter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import Foundation

final class ConvertPresenter: ObservableObject, PresenterInterface {

    // VIPER
    var router: ConvertRouterPresenterInterface!
    var interactor: ConvertInteractorPresenterInterface!

    @Published var runCount = 30

    private var timer: Timer?
}

extension ConvertPresenter: ConvertPresenterRouterInterface {}
extension ConvertPresenter: ConvertPresenterInteractorInterface {}
extension ConvertPresenter: ConvertPresenterViewInterface {

    var runCountPublisher: Published<Int>.Publisher { $runCount }

    func startTimer() {
        runCount = 30
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            self?.runCount -= 1

            if self?.runCount == 0 {
                timer.invalidate()
                self?.router.back()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
    }

    func next() {
        router.next()
    }
}
