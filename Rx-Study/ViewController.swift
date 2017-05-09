//
//  ViewController.swift
//  Rx-study
//
//  Created by Tanaka Hayate on 2017/05/06.
//  Copyright © 2017 Tanaka Hayate. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusLabel.textAlignment = NSTextAlignment.center
        self.inputTextField.backgroundColor = UIColor.gray
        
        // 1. textFieldの文字の変化を観察対象とする
        let nameObservable: Observable<String?> = inputTextField.rx.text.asObservable()
        let subscription = nameObservable.subscribe(
            onNext: {value in
                guard self != nil else { return }

                //do something
                if  value != nil {
                self.statusLabel.text = value!
                }

                print(value)
        }).addDisposableTo(disposeBag)
        
        // ボタンのタップされるのを監視
        let tapEvent: Observable = self.goButton.rx.tap.asObservable()
        tapEvent.subscribe(
            onNext: { _ in
        // do something
                self.goNext()
        }).addDisposableTo(self.disposeBag)
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.rx.event.subscribe(
            onNext: { [weak self] gesture in
              guard self != nil else { return }
                self?.goNext()
                //what to do
            }).addDisposableTo(disposeBag)
//        self.goButton.addGestureRecognizer(tapGesture)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func goNext() {
        let next = storyboard!.instantiateViewController(withIdentifier: "SecondViewController")
        self.present(next,animated: true, completion: nil)
    }


}

