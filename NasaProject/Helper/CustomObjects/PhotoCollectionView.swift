//
//  PhotoCollectionView.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//


import UIKit

class PhotoCollectionView : UICollectionView {
    
    var items : [Photos] = [Photos]()
    
    var cellSizeW : CGFloat = 0
    var cellSizeH : CGFloat = 0
    
    var click : (Int) -> () = { _ in }
    var load : () -> () = {  }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        self.collectionViewLayout = layout
        
        self.delegate   = self
        self.dataSource = self
        
    }
    
}

extension PhotoCollectionView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = items[indexPath.row]
        
        
        let cell = collectionView.dequeueReusableCell(PhotoViewCell.self, indexPath)!
        cell.bindView(item)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:((collectionView.frame.width  - 32 ) / 2 ) - 10
                      , height:( (collectionView.frame.width - 32) / 2 ) - 10)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        click(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastRowIndex = collectionView.numberOfItems(inSection: 0) - 1
        if indexPath.row == lastRowIndex{
            load()
        }
    }
    
}
