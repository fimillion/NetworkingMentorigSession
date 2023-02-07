//
//  UImageViewExtension.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 17.01.2023.
//

import UIKit

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = loadedImage
                    }
                }
            }
        }
    }
}