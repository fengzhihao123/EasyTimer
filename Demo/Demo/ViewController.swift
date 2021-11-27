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
    var name = "ViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        key = EasyTimer.shared.resume(deadline: .now(), repeating: .seconds(1), leeway: .seconds(0), handler: { [weak self] in
            print(self?.name)
            print(Thread.current)
        }, cancelHandler: {
            print("cancelHandler")
        } , async: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        EasyTimer.shared.cancel(key: key)
    }
    
    deinit {
        EasyTimer.shared.cancel(key: key)
        print("deinit")
    }
}

