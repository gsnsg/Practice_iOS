//
//  FoodOrderingViewController.swift
//  Practice_iOS
//
//  Created by Sai Nikhit Gulla on 06/02/22.
//

import UIKit

class FoodOrderingViewController: UIViewController {

    private var collectionView: UICollectionView = {
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        cv.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CV_Cell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        return cv
    }()
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var cards: [Card] = [
        Card(title: "McDonald's", imageName: "mcd", category: "Burgers", country: "American", priceTrend: "$$$", color: Colors.color1, logoImg: "mcd_logo"),
        Card(title: "KFC", imageName: "kfc", category: "Fried Chicken", country: "American", priceTrend: "$$$$", color: Colors.color2, logoImg: "kfc_logo"),
        Card(title: "Subway", imageName: "subway", category: "Subs", country: "Italian", priceTrend: "$$$", color: Colors.color3, logoImg: "subway_logo"),
        Card(title: "Dominos", imageName: "dominos", category: "Pizza", country: "American", priceTrend: "$$", color: Colors.color4, logoImg: "dominos_logo")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        setup()
    }
    
    func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 620),
            
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -20),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func updateUI(with card: Card) {
        view.backgroundColor = card.color
        logoImageView.image = UIImage(named: card.logoImg)
    }

}

extension FoodOrderingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CV_Cell", for: indexPath) as? CardCollectionViewCell else {
            fatalError("Couldn't decode CardCollectionViewCell")
        }
        
        if indexPath.row == 0 {
            self.updateUI(with: cards[indexPath.row])
        }
        
        cell.configure(with: cards[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: collectionView.frame.width, height: 600)
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scroll View DID ")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()

        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size

        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }

        self.updateUI(with: cards[indexPath.row])
    }
    
}



