//
//  NoDataPageView.swift
//  NasaProject
//
//  Created by FATIH on 24.02.2021.
//

import Foundation
import UIKit
class NoDataPageView: UIView {
    var imageNoData : UIImageView!
    var labelNodata : UILabel!
    var screenSize = UIScreen.main.bounds

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
        
    }
    
    func initializeView() {
        
        imageNoData = UIImageView(frame: CGRect(x: (self.frame.width - 100)  / 2, y:  (self.frame.height - 100)  / 2, width: 100, height: 100))
        imageNoData.image = #imageLiteral(resourceName: "splashIcon")
        imageNoData.backgroundColor = .clear
        self.addSubview(imageNoData)
        
        labelNodata = UILabel(frame: CGRect(x: 16, y: ((self.frame.height - 100)  / 2 ) + 120 , width: self.frame.width - 32 , height: 50))
        labelNodata.backgroundColor = .clear
        labelNodata.font = UIFont.boldSystemFont(ofSize: 20)
        labelNodata.textAlignment = .center
        labelNodata.textColor = .white
        self.addSubview(labelNodata)
        
    }
}
