//
//  BasePopUp.swift
//  NasaProject
//
//  Created by FATIH on 24.02.2021.
//

import UIKit

class BasePopUp: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(dismissableViewTapped))
        self.view.addGestureRecognizer(gesture)
        self.view.isUserInteractionEnabled = true
        
    }
    
    @objc func dismissableViewTapped(_ sender:UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
    }
    
}
