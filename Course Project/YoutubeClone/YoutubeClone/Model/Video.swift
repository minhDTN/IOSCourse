//
//  Home.swift
//  YoutubeClone
//
//  Created by minhdtn on 24/08/2022.
//

import Foundation

class Video: NSObject {
    var thumbnailImageName: String?
    var title: String?
    var chanel: Chanel?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    func formattedNumberOfViews() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: numberOfViews ?? 0) ?? " "
    }
}

class Chanel: NSObject {
    var name: String?
    var profileImageName: String?
}
