//
//  BaseViewController.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func registerLoadableViewModel(viewModel: BaseViewModel?) {
            
        // Yukleme Basladıgında
            viewModel?.onLoadDidStart = {
            }
            
        //Yukleme basarılı bır sekılde bıttı
            viewModel?.onLoadDidFinish = {
                
            }
            
        //Yukleme Hata Ile bıttı
            viewModel?.onLoadDidFinishWithError = { (error) in
                DispatchQueue.main.async {
                    self.getError()
                }
            }
            
            viewModel?.onChange = { [weak self] in
                DispatchQueue.main.async {
                    self?.refreshViews()
                }
            }
        }
    
    func refreshViews()  {

    }
    func getError()  {

    }
    
}
