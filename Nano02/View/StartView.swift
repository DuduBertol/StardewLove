//
//  StartView.swift
//  Nano02
//
//  Created by Eduardo Bertol on 23/09/25.
//

import UIKit

final class StartView: UIView {
    
    var onButtonTap: (() -> Void)?
    
    // MARK: - Subviews


    private(set) lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "Background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "vai dar namoro no..."
        
        label.font = UIFont(name: "Stardew Valley", size: 32)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        
        setShadow(on: label)
        
        return label
    }()

    private(set) lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "LogoStardew")
        imageView.contentMode = .scaleAspectFill
        
        setShadow(on: imageView)
        
        return imageView
    }()
    
    
    private(set) lazy var buttonStart: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setBackgroundImage(UIImage(named: "NewButton"), for: .normal)
        button.contentMode = .scaleAspectFill
        
        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
        
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 4
        
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
//    func setUser(_ user: User) {
//        self.user = user
//        label.text = user.name
//    }
    
    private func addSubviews() {
//        addSubview(rectDarkBrown)
//        addSubview(rectBrown)
//        addSubview(rectWhite)
        addSubview(backgroundImage)
        addSubview(titleLabel)
        addSubview(logoImage)
        addSubview(buttonStart)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: widthAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: heightAnchor),

            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.85),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),

            logoImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 350),
            logoImage.heightAnchor.constraint(equalToConstant: 160),
            
            buttonStart.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 80),
            buttonStart.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStart.widthAnchor.constraint(equalToConstant: 184),
            buttonStart.heightAnchor.constraint(equalToConstant: 144),

        ])
    }
    
    private func setShadow(on view: UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.35
        view.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.layer.shadowRadius = 0
    }
    
    // MARK: - Actions
    @objc
    private func didPressButton() {
        onButtonTap?()
    }
}



//    private(set) lazy var rectDarkBrown: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.backgroundColor = .sDarkBrown
//
//        return view
//    }()
//
//    private(set) lazy var rectBrown: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.backgroundColor = .sBrown
//
//        return view
//    }()
//
//    private(set) lazy var rectWhite: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.layer.cornerRadius = 14
//        view.backgroundColor = .white
//
//        return view
//    }()


//            rectDarkBrown.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            rectDarkBrown.centerXAnchor.constraint(equalTo: centerXAnchor),
//            rectDarkBrown.widthAnchor.constraint(equalToConstant: 345),
//            rectDarkBrown.heightAnchor.constraint(equalToConstant: 122),
//
//            rectBrown.centerYAnchor.constraint(equalTo: rectDarkBrown.centerYAnchor),
//            rectBrown.centerXAnchor.constraint(equalTo: rectDarkBrown.centerXAnchor),
//            rectBrown.widthAnchor.constraint(equalToConstant: 320),
//            rectBrown.heightAnchor.constraint(equalToConstant: 100),
//
//            rectWhite.centerYAnchor.constraint(equalTo: rectBrown.centerYAnchor),
//            rectWhite.centerXAnchor.constraint(equalTo: rectBrown.centerXAnchor),
//            rectWhite.widthAnchor.constraint(equalToConstant: 292),
//            rectWhite.heightAnchor.constraint(equalToConstant: 77),
