//
//  TestViewController.swift
//  OneToN
//
//  Created by Yerbol Kopzhassar on 03/09/2016.
//  Copyright © 2016 OneToN. All rights reserved.
//

import UIKit



private let reuseIdentifier = "TestCell"

class TestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var TestColleсtionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        
//        guard let flowLayout = heroCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
//            return
//        }
//        
//        let bounds = heroCollectionView.bounds
//        let ratio: CGFloat = 0.561
//        let width: CGFloat = bounds.width / 3 - flowLayout.minimumInteritemSpacing * 2
//        let height = width * ratio + 20
//        
//        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    
    //header config
     func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
       
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", forIndexPath: indexPath)  as! HeaderTestCollection

        return header
    }
    

    

    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3        }
    
    
    //cell config
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier((reuseIdentifier), forIndexPath: indexPath) as! CellTestCollectionview
        
        cell.numberOnImage.text = "123"
        
        return cell
    }



}
