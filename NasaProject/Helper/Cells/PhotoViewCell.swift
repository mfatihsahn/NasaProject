//
//  PhotoViewCell.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//

import UIKit
import Kingfisher

class PhotoViewCell: UICollectionViewCell {

        @IBOutlet weak var imPoster : UIImageView!

        func bindView(_ item : Photos)  {

            imPoster.kf.setImage(with: URL(string: item.img_src), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
            imPoster.clipsToBounds = true
        }
}
