//
//  UIImageView + Extensions.swift
//  AstronomyPhotos
//
//  Created by Matthew Ramos on 12/9/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(with urlString: String, completion: @escaping (Result<UIImage, AppError>) -> ()) {
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .orange
        activityIndicator.center = center
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        NetworkHelper.shared.performDataTask(with: urlString) { [weak activityIndicator](result) in
            
            DispatchQueue.main.async {
                activityIndicator?.stopAnimating()
            }
            
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                if let image = UIImage (data: data) {
                completion(.success(image))
            }
        }
}
}
}
