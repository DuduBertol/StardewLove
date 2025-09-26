//
//  EndViewController.swift
//  Nano02
//
//  Created by Eduardo Bertol on 24/09/25.
//

import UIKit

class EndViewController: UIViewController {
    
    static var result: Character?
    
    private let endView = EndView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view = endView
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        endView.onButtonTap = navigateToRootBack
        
        endView.characterLabel.text = EndViewController.result?.name
        endView.characterImage.image = UIImage(named: EndViewController.result?.name ?? "")
    }
    
    private func navigateToRootBack() {
        navigationController?.popToRootViewController(animated: true)
    }
}
