//
//  HomeViewModel.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//

import Foundation

class HomeViewModel : BaseViewModel {
    
    var responsePhotoModel = [Photos]()
    
    func getPhotoList(camType : String? , page : Int, roverType : String )
    {
        self.loadDidStart()
        let request = PhotoRequest(carType: roverType, sol: 1000 , page: page, camera: camType )
        PhotoService.shared.getPhotos(request: request) { [weak self] result  in
            switch result{
            case .success(let response ):
                self?.responsePhotoModel = response
                self?.loadDidFinish()
                self?.change()
            case .failure(let error):
                self?.loadDidFinishWithError(error: error)
            }
        }
    }
}


