//
//  ViewController2.swift
//  RxFlowBug
//
//  Created by Anton Nazarov on 25/04/2019.
//  Copyright © 2019 Anton Nazarov. All rights reserved.
//


import UIKit
import RxFlow
import RxCocoa
import RxSwift

class ViewController2: UIViewController, Stepper {
    @IBOutlet var button: UIButton!
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
        button.rx.tap.map { Steps.two }.bind(to: steps).disposed(by: disposeBag)
    }


}


