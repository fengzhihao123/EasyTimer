//
//  ViewController.swift
//  Demo
//
//  Created by Phil.Feng on 2020/9/1.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alertDemo()
    }

    func alertDemo() {
        let alertVC = SimpleAlert.fzh_alert(title: "title", message: "message") { () -> [FZHAction] in
            FZHAction.destructive("Delete") { }
            FZHAction.cancel("Calcel") { }
        }
        present(alertVC, animated: true, completion: nil)
    }
}

