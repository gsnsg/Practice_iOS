//
//  CardCollectionViewCell.swift
//  Practice_iOS
//
//  Created by Sai Nikhit Gulla on 06/02/22.
//

import UIKit

struct Colors {
    static let color1: UIColor = UIColor(red: 248/255, green: 126/255, blue: 5/255, alpha: 1)
    static let color2: UIColor = UIColor(red: 171/255, green: 24/255, blue: 47/255, alpha: 1)
    static let color3: UIColor = UIColor(red: 22/255, green: 191/255, blue: 0/255, alpha: 1)
    static let color4: UIColor = UIColor(red: 5/255, green: 147/255, blue: 248/255, alpha: 1)
}

struct Card {
    let title: String
    let imageName: String
    let category: String
    let country: String
    let priceTrend: String
    let color: UIColor
    let logoImg: String
}


class CardCollectionViewCell: UICollectionViewCell {
    
    let cardView:UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 20
        return uiView
    }()
    
    private var imageContainerView: UIView = {
        let uv = UIView(frame: .zero)
        uv.translatesAutoresizingMaskIntoConstraints = false
        uv.layer.cornerRadius = 20
        return uv
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "10 - 15 mins"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    
    private var orderNowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Order from here", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 30
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
        backgroundColor = .clear
        
        addSubview(cardView)
        cardView.addSubview(imageContainerView)
        imageContainerView.addSubview(imageView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(ratingLabel)
        cardView.addSubview(timeLabel)
        cardView.addSubview(orderNowButton)
        
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            imageContainerView.topAnchor.constraint(equalTo: cardView.topAnchor , constant: 20),
            imageContainerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            imageContainerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            imageContainerView.heightAnchor.constraint(equalToConstant: 300),
            
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            
            ratingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            ratingLabel.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 20),
            timeLabel.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            
            orderNowButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            orderNowButton.widthAnchor.constraint(equalToConstant: 250),
            orderNowButton.heightAnchor.constraint(equalToConstant: 60),
            orderNowButton.centerXAnchor.constraint(equalTo: centerXAnchor)

        ])

    }
    
    func configure(with card: Card) {
        
        titleLabel.text = card.title
        
        imageView.image = UIImage(named: card.imageName)
        
        imageContainerView.backgroundColor = card.color
        
        // rating label
        let myAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15) , NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        
        let ratingString = NSMutableAttributedString(string: "", attributes: myAttributes)
        

        let font = UIFont.systemFont(ofSize: 15)
        
        let starImage = NSTextAttachment()
        starImage.image = UIImage(named: "star")
        starImage.bounds = CGRect(x: 0, y: (font.capHeight - 15).rounded() / 2, width: 15, height: 15)
        
        let starImageString = NSAttributedString(attachment: starImage)
        
        let spaceString = NSAttributedString(string: " ")
        let categoryString = NSAttributedString(string: " \(card.category), \(card.country) \(card.priceTrend)", attributes: myAttributes)
        
        ratingString.append(starImageString)
        ratingString.append(spaceString)
        ratingString.append(categoryString)
    
        ratingLabel.attributedText = ratingString
    }
}
