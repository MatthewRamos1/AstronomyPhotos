//
//  PlanetCell.swift
//  AstronomyPhotos
//
//  Created by Matthew Ramos on 12/9/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class PlanetCell: UITableViewCell {

@IBOutlet weak var planetImageView: UIImageView!

func configureCell(with urlString: String) {
planetImageView.setImage(with: urlString) { result in
    switch result {
    case .failure:
        self.planetImageView.image = UIImage(systemName: "person.fill")
    case .success(let image):
        DispatchQueue.main.async {
        self.planetImageView.image = image
        }
    }
    }
}
}
