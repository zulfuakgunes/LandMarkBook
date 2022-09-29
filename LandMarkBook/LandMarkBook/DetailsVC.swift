//
//  DetailsVC.swift
//  LandMarkBook
//
//  Created by Zülfü Akgüneş on 29.09.2022.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet var textLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedLandMarkImage = UIImage()
    var selectedLandMarkName = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = selectedLandMarkName
        imageView.image = selectedLandMarkImage
    }
    
}
