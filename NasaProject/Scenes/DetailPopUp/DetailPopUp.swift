//
//  DetailPopUp.swift
//  NasaProject
//
//  Created by FATIH on 24.02.2021.
//

import UIKit
import Kingfisher
class DetailPopUp: BasePopUp {
    
    @IBOutlet weak var finishTime: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var roverStatus: UILabel!
    @IBOutlet weak var camName: UILabel!
    @IBOutlet weak var roverName: UILabel!
    @IBOutlet weak var titleImg: UIImageView!
    var photoList : Photos!
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData(item: photoList)
    }
    
    func fillData(item : Photos){
        finishTime.text = "Landing Time : " + item.rover!.landing_date
            .capitalizingFirstLetter()
        startTime.text = "Launch Time : " + item.rover!.launch_date
            .capitalizingFirstLetter()
        roverStatus.text = "Rover Status : " + item.rover!.status
            .capitalizingFirstLetter()
        camName.text = "Camera Name : " + item.camera!.full_name
            .capitalizingFirstLetter()
        roverName.text = "Rover Name : " + item.rover!.name
            .capitalizingFirstLetter()
        titleImg.kf.setImage(with: URL(string: item.img_src), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
    }
    
    @IBAction func closeBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
