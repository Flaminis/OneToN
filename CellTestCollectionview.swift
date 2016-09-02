//
//  CellTestCollectionview.swift
//  OneToN
//
//  Created by Yerbol Kopzhassar on 03/09/2016.
//  Copyright © 2016 OneToN. All rights reserved.
//

import UIKit


//protocol GuideCVCDelegate {
//    func likeButtonDidPress(cell: GuideCVC, button: UIButton)
//    func deleteButtonDidPress(cell:GuideCVC, button: UIButton)
//}

class CellTestCollectionview: UICollectionViewCell {
    
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var numberOnImage: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()

    }
}
