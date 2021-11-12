//
//  ViewController.swift
//  Вторая тема
//
//  Created by Александр on 10.11.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var TopText: UILabel!
    
    @IBAction func Buttonn(_ sender: Any) {
        print("Пользователь тыкнул ботом")
    }
}

