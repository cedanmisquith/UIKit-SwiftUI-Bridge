//
//  ViewController.swift
//  UIKit SwiftUI Bridge
//
//  Created by Cedan Misquith on 02/02/23.
//

import UIKit
import SwiftUI

protocol ViewControllerDelegate: AnyObject {
    func sendDataBack(data: String)
}

class ViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func goToSwiftUI(_ sender: Any) {
        let swiftUIViewController = UIHostingController(rootView: SwiftUIView(navigationController: self.navigationController, dataFromPreviousView: "This data is from UIKit ViewController", delegate: self))
        self.navigationController?.pushViewController(swiftUIViewController, animated: true)
    }
    @IBAction func goToSwiftUIData(_ sender: Any) {
        let swiftUIViewController = UIHostingController(rootView: SwiftUIView(navigationController: self.navigationController))
        self.navigationController?.pushViewController(swiftUIViewController, animated: true)
    }
}
extension ViewController: ViewControllerDelegate {
    func sendDataBack(data: String) {
        dataLabel.text = "UIKit ViewController" + " \(data)"
    }
}
