//
//  ImageViewExtension.swift
//  YoutubeClone
//
//  Created by minhdtn on 25/08/2022.
//

import Foundation
import UIKit
extension UIImageView {
    func setupImage(withURL url: String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("DEBUG: \(String(describing: error))")
                    return
                }
                if let safeData = data {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: safeData)
                    }
                }
            }
            task.resume()
        }
    }
}
