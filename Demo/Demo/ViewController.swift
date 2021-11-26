//
//  ViewController.swift
//  Demo
//
//  Created by Phil.Feng on 2020/9/1.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var key: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        key = EasyTimer.shared.resume(deadline: .now(), repeating: .seconds(1), leeway: .seconds(0), handler: {
            print(1111)
        }, async: false)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        EasyTimer.shared.cancel(key: key)
    }
}

