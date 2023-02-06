//
//  SwiftUIView.swift
//  UIKit SwiftUI Bridge
//
//  Created by Cedan Misquith on 02/02/23.
//

import SwiftUI

struct SwiftUIView: View {
    weak var navigationController: UINavigationController?
    var dataFromPreviousView: String?
    weak var delegate: ViewControllerDelegate?
    var body: some View {
        VStack {
            let text = "SwiftUI View" + " \(dataFromPreviousView ?? "")"
            Text(text).padding()
            Button(action: {
                navigationController?.popViewController(animated: true)
                delegate?.sendDataBack(data: "")
            }) {
                Text("Back to UIKit Screen")
                    .frame(width: UIScreen.main.bounds.width, height: 10, alignment: .center)
            }.padding()
            Button(action: {
                navigationController?.popViewController(animated: true)
                delegate?.sendDataBack(data: "This data is from SwiftUI View")
            }) {
                Text("Back to UIKit Screen with data")
                    .frame(width: UIScreen.main.bounds.width, height: 10, alignment: .center)
            }
            Button(action: {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "NewViewController") as? NewViewController else {
                    return
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }) {
                Text("Go to VC")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
