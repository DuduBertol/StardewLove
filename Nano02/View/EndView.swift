//
//  EndView.swift
//  Nano02
//
//  Created by Eduardo Bertol on 24/09/25.
//

import UIKit

class EndView: UIView {
    
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
        
        label.text = "deu namoro com..."

        label.font = UIFont(name: "Stardew Valley", size: 32)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private(set) lazy var portraitImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "PortraitBorder")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) lazy var characterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont(name: "Stardew Valley", size: 32)
        label.textColor = .sDarkBrown
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private(set) lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) lazy var buttonStart: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setBackgroundImage(UIImage(named: "NewButton"), for: .normal)
        button.contentMode = .scaleAspectFill
        
        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews()
        setupConstraints()
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(backgroundImage)
        addSubview(titleLabel)
        addSubview(portraitImage)
        addSubview(characterLabel)
        addSubview(characterImage)
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

            portraitImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            portraitImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            portraitImage.widthAnchor.constraint(equalToConstant: 278),
            portraitImage.heightAnchor.constraint(equalToConstant: 321.5),
            
            characterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterLabel.topAnchor.constraint(equalTo: portraitImage.topAnchor, constant: 36),
            characterLabel.widthAnchor.constraint(equalTo: portraitImage.widthAnchor, multiplier: 0.85),
            characterLabel.heightAnchor.constraint(equalToConstant: 45),
            
            characterImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterImage.topAnchor.constraint(equalTo: characterLabel.bottomAnchor, constant: -1),
            characterImage.widthAnchor.constraint(equalToConstant: 218),
            characterImage.heightAnchor.constraint(equalToConstant: 218),
            
            buttonStart.topAnchor.constraint(equalTo: portraitImage.bottomAnchor, constant: 80),
            buttonStart.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStart.widthAnchor.constraint(equalToConstant: 184),
            buttonStart.heightAnchor.constraint(equalToConstant: 144),
        ])
    }
    
    // MARK: - Actions
    @objc
    private func didPressButton() {
        onButtonTap?()
    }
}
