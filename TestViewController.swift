//
//  TestViewController.swift
//  OneToN
//
//  Created by Yerbol Kopzhassar on 03/09/2016.
//  Copyright © 2016 OneToN. All rights reserved.
//

import UIKit
import LTMorphingLabel

private let reuseIdentifier = "TestCell"

class TestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var TestColleсtionView: UICollectionView!
    
    let headerQuestions = ["Выберите девушек ","2","3","4","5","6","7","8","9","10"]
    var headerCounter = 0
    var counter = 0
    var shymkenCouner = 0
    var imageCounter = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutSubviews()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let flowLayout = TestColleсtionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        let bounds = TestColleсtionView.bounds
        let ratio: CGFloat = 2/3
        let width: CGFloat = bounds.width / 2 - flowLayout.minimumInteritemSpacing 
        let height = width * ratio + 20
        
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    
    //header config
     func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
       
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", forIndexPath: indexPath)  as! HeaderTestCollection
        header.questionTitle.text = headerQuestions[headerCounter]
        return header
    }
    

    

    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6 }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as!CellTestCollectionview
        if (cell.cellDidntPress){
        
        cell.cellDidntPress = false
        counter += 1
            
        shymkenCouner += indexPath.row*indexPath.row/counter
        
        print(shymkenCouner)
        cell.numberOnImage.morphingEffect = .Evaporate
        cell.numberOnImage.text = String(counter)
        
        }
        
        
        if (counter==6){
            loadNextQuestions()
        }
    }
    
    
    //cell config
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier((reuseIdentifier), forIndexPath: indexPath) as! CellTestCollectionview
        
        cell.numberOnImage.text = ""
        cell.testImage.image = UIImage(named: "\(imageCounter)")
        cell.layoutSubviews()
        
//        cell.testImage.
        imageCounter+=1
        cell.cellDidntPress = true
        
        return cell
    }

    
    func loadNextQuestions(){
        if (imageCounter>=60){
            //SDES TY NA SVOI VC uhodish
        }
        TestColleсtionView.reloadData()
        headerCounter += 1
        counter = 0
    }
    
    
    


}
