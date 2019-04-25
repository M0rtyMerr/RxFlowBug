//
//  AppDelegate.swift
//  RxFlowBug
//
//  Created by Anton Nazarov on 25/04/2019.
//  Copyright © 2019 Anton Nazarov. All rights reserved.
//

import UIKit
import RxFlow
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator = FlowCoordinator()
    let disposeBag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        guard let window = self.window else { return false }

        self.coordinator.rx.willNavigate.subscribe(onNext: { (flow, step) in
            print ("will navigate to flow=\(flow) and step=\(step)")
        })
            .disposed(by: self.disposeBag)

        self.coordinator.rx.didNavigate.subscribe(onNext: { (flow, step) in
            print ("did navigate to flow=\(flow) and step=\(step)")
        })
            .disposed(by: self.disposeBag)

        let appFlow = AppFlow()

        Flows.whenReady(flow1: appFlow) { root in
            window.rootViewController = root
        }

        self.coordinator.coordinate(flow: appFlow, with: OneStepper(withSingleStep: Steps.base))

        return true
    }
}

