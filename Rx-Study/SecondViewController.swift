//
//  2ndViewController.swift
//  Rx-study
//
//  Created by Tanaka Hayate on 2017/05/06.
//  Copyright © 2017 Tanaka Hayate. All rights reserved.
//

import UIKit
import RxSwift

class SecondViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var ackButton: UIButton!
    var opened = Variable<Bool>(false)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
