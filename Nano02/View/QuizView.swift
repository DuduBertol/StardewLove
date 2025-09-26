//
//  QuizView.swift
//  Nano02
//
//  Created by Eduardo Bertol on 23/09/25.
//

import UIKit

final class QuizView: UIView {
    
    var onOptionOneTapped: (() -> Void)?
    var onOptionTwoTapped: (() -> Void)?

    // MARK: - Subviews
    
    private(set) lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "Background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont(name: "Stardew Valley", size: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.layer.masksToBounds = false
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.35
        label.layer.shadowOffset = CGSize(width: -3, height: 3)
        label.layer.shadowRadius = 0
        
        return label
    }()
    
    private(set) lazy var orLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "OR"

        label.font = UIFont(name: "Stardew Valley", size: 32)
        label.textColor = .sDarkBrown
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    
    private lazy var optionOneButton: UIButton = buttonOption()
    private lazy var optionTwoButton: UIButton = buttonOption()
    
    
    private func pageControlCircle() -> UIView {
        let circleView = UIView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        circleView.backgroundColor = .systemGray2

        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: 8),
            circleView.heightAnchor.constraint(equalToConstant: 8),
        ])
        
        circleView.layer.cornerRadius = 6
        circleView.clipsToBounds = true
        
        return circleView
    }
    
    private func buttonOption() -> UIButton {
    
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
    
        button.setBackgroundImage(UIImage(named: "SignBorder"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.titleLabel?.font = UIFont(name: "Stardew Valley", size: 32)
        button.titleLabel?.numberOfLines = 0
        
//        button.titleLabel?.widthAnchor.constraint(equalTo: button.widthAnchor, constant: -50).isActive = true
        
        setShadow(on: button)
        
        return button
    }
    
    private lazy var pageControl: UIView = {
        let circ1 = pageControlCircle()
        let circ2 = pageControlCircle()
        let circ3 = pageControlCircle()
        let circ4 = pageControlCircle()
        let circ5 = pageControlCircle()
        let circ6 = pageControlCircle()
        let circ7 = pageControlCircle()
        let circ8 = pageControlCircle()
        let circ9 = pageControlCircle()
        let circ10 = pageControlCircle()
        
        let stackView = UIStackView(arrangedSubviews: [circ1, circ2, circ3, circ4, circ5, circ6, circ7, circ8, circ9, circ10])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .sBlue
        
        optionOneButton.addTarget(self, action: #selector(didPressOptionOneButton), for: .touchUpInside)
        optionTwoButton.addTarget(self, action: #selector(didPressOptionTwoButton), for: .touchUpInside)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func addSubviews() {
        addSubview(backgroundImage)
        addSubview(questionLabel)
        addSubview(optionOneButton)
        addSubview(orLabel)
        addSubview(optionTwoButton)
        addSubview(pageControl)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: widthAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: heightAnchor),
            
            questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            questionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            questionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            questionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            
            orLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            orLabel.topAnchor.constraint(equalTo: optionOneButton.bottomAnchor, constant: 24),
            orLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: 24),

            //Buttons
            optionOneButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            optionOneButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 48),
            optionOneButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            optionOneButton.heightAnchor.constraint(equalToConstant: 230),
                        
            optionTwoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            optionTwoButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 24),
            optionTwoButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            optionTwoButton.heightAnchor.constraint(equalToConstant: 230),
            
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            pageControl.heightAnchor.constraint(equalToConstant: 16,)
        ])
    }
    
    func setupFields(questionText: String, optionOneText: String, optionTwoText: String, optionOneImage: String? = nil, optionTwoImage: String? = nil) {
        questionLabel.text = questionText
        optionOneButton.setTitle(optionOneText, for: .normal)
        optionTwoButton.setTitle(optionTwoText, for: .normal)
        
        optionOneButton.setImage(UIImage(named: optionOneImage ?? ""), for: .normal)
        optionTwoButton.setImage(UIImage(named: optionTwoImage ?? ""), for: .normal)
    }
    
    func updatePageControl(currentPage: Int){
        guard let stackView = pageControl as? UIStackView else { return }
        
        for (index, view) in stackView.arrangedSubviews.enumerated() {
            if index < currentPage {
                view.backgroundColor = .sDarkBrown // Completado
            } else if index == currentPage {
                view.backgroundColor = .white // Atual
            } else {
                view.backgroundColor = .systemGray4 // Não completado
            }
        }
    }
    
    private func setShadow(on view: UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4
    }
    
    
    // MARK: - Actions
    @objc
    private func didPressOptionOneButton() {
        onOptionOneTapped?()
    }
    
    @objc
    private func didPressOptionTwoButton() {
        onOptionTwoTapped?()
    }
}


//TODO: Add subview do page control-
//TODO: Setup constraints -
