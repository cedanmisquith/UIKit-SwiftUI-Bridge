//
//  NewViewController.swift
//  UIKit SwiftUI Bridge
//
//  Created by Cedan Misquith on 06/02/23.
//

import UIKit

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func temp(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
