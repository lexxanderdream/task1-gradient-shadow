//
//  ViewController.swift
//  gradient-shadow
//
//  Created by Alexander Zhuchkov on 03.02.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Subviews
    private let squareView: UIView = {
        let view = GradientView()
        
        // Setup
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Fill
        if let gradientLayer = view.layer as? CAGradientLayer {
            gradientLayer.colors = [UIColor.red, UIColor.blue].map { $0.cgColor }
            gradientLayer.startPoint = .init(x: 0, y: 0)
            gradientLayer.endPoint = .init(x: 1, y: 1)
        }
        
        // Shadow
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .init(width: 5, height: 5)
        view.layer.shadowRadius = 10
        
        // Size
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        return view
    }()
    
    
    // MARK: - Helper Methods
    private func setupView() {
        view.addSubview(squareView)
        
        // Layout Subview
        squareView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        setupView()
    }
}

// MARK: - GradientView
extension ViewController {
    
    class GradientView: UIView {
        override open class var layerClass: AnyClass {
            return CAGradientLayer.classForCoder()
        }
    }
    
}
