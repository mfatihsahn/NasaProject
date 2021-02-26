//
//  PhotoService.swift
//  NasaProject
//
//  Created by FATIH on 25.02.2021.
//

import Foundation
import Alamofire

class PhotoService {
 
    static let shared = PhotoService()
    
    func constructPhotoUrl(carType : String) -> URL? {
        
        let photoBaseUrl = apiUrl + "mars-photos/api/v1/rovers/"
        var photoUrl = URL(string: photoBaseUrl)
        photoUrl?.appendPathComponent(carType)
        photoUrl?.appendPathComponent("photos")
         
        return photoUrl
    }
    
    func getPhotos(request : PhotoRequest, completion : @escaping (Result<[Photos], Error>) -> Void)  {
        
        guard let url = self.constructPhotoUrl(carType: request.carType) else { return }
        var parameters = request.dictionary
        parameters.removeValue(forKey: "carType")
        
        RequestManager.shared.request(url, parameters, .get, encoding: URLEncoding.queryString) { (response : BaseResult<Photos>) in 
            completion(.success(response.photos ?? []))
        } failure: {error in
            completion(.failure(error))
        }

    }
    
}
