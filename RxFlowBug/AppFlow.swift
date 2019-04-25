//
//  AppFlow.swift
//  RxFlowBug
//
//  Created by Anton Nazarov on 25/04/2019.
//  Copyright © 2019 Anton Nazarov. All rights reserved.
//


import RxFlow

enum Steps: Step {
    case base
    case one
    case two
}

class AppFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    let rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PageViewController") as! PageViewController

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? Steps else { return .none }

        switch step {
        case .base:
            let flowContributors = rootViewController.orderedViewControllers.map { FlowContributor.contribute(withNextPresentable: $0, withNextStepper: $0) }
            return .multiple(flowContributors: flowContributors)
        default:
            print(step)
            return .none
        }
    }
}

