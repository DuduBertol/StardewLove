//
//  ViewController.swift
//  Nano02
//
//  Created by Eduardo Bertol on 22/09/25.
//

import UIKit

class StartingViewController: UIViewController {

    private let startView = StartView()
    
    override func loadView() {
        super.loadView()
        self.view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupGradientBackground()
        
        startView.onButtonTap = navigateToQuizView
    }

    func navigateToQuizView() {
        let destination = QuizViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
    
//    func setupGradientBackground() {
//        let gradientLayer = CAGradientLayer()
//        
//        // Suas 5 cores (substitua pelos valores reais)
//        gradientLayer.colors = [
//            UIColor.sDarkBlue,
//            UIColor.sBlue,
//            UIColor.sLightBlue,
//            UIColor.sGreen,
//            UIColor.sYellow
//        ]
//        
//        // Posições das cores (0.0 a 1.0)
//        gradientLayer.locations = [0.0, 0.3, 0.65, 0.8, 0.9]
//        
//        // Frame do gradiente
//        gradientLayer.frame = view.frame
//        
//        // Direção do gradiente (vertical por padrão)
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)  // topo
//        gradientLayer.endPoint = CGPoint(x: 0, y: 1)    // baixo
//        
//        // Adiciona como primeira camada (fundo)
//        view.layer.addSublayer(gradientLayer)
//    }
    
    
}

