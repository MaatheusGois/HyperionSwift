//
//  HyperionSwift.swift
//  HyperionSwift
//
//  Created by Matheus Gois on 02/01/25.
//

import UIKit

public class HyperionSwift {

    private init() {}
    public static let shared = HyperionSwift()

    private lazy var menu = MenuViewController(delegate: self)
    private lazy var menuPresenter: SideMenuPresenting = SideMenuPresenter(
        menuViewControllerFactory: menu
    )

    public func setup() {
        if let controller = topViewControoler() {
            setup(in: controller)
        }
    }

    public func present() {
        if let controller = topViewControoler() {
            present(from: controller)
        }
    }

    public func setup(in controller: UIViewController) {
        menuPresenter.setup(in: controller)
    }

    public func present(from controller: UIViewController) {
        menuPresenter.present(from: controller)
    }

    private func topViewControoler() -> UIViewController? {
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
    }
}

extension HyperionSwift: MenuDelegate {
    func didSelectMenuItem(_ menuItem: MenuItem) {
        switch menuItem {
        case .measurement:
            activateMeasurement()
        }
    }

    private func activateMeasurement() {
        menu.dismiss(animated: true)
        UIWindow.isEnable = true
        MeasurementWindowManager.attachedWindow = UIWindow.keyWindow
    }
}
