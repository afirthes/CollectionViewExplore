//
//  ViewController.swift
//  CollectionViewExplore
//
//  Created by Afir Thes on 08.09.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,
                      UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    let data: [UIImage] = [#imageLiteral(resourceName: "image2"), #imageLiteral(resourceName: "image4"), #imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image3")]
    
    let edgeInsets: CGFloat = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        imagesCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReusableCell")
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        UIStatusBarStyle.lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCell", for: indexPath) as! CollectionViewCell
        cell.photoImage.image = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 3
        let padding: CGFloat = 6
        let collectionViewWidth: CGFloat = collectionView.frame.width - (padding * (itemsPerRow-1)) - edgeInsets * 2
        let widthPerItem: CGFloat = collectionViewWidth / itemsPerRow
        print(widthPerItem)
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return CGFloat(6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: edgeInsets, left: edgeInsets, bottom: edgeInsets, right: edgeInsets)
    }

}

