//
//  VideoManager.swift
//  YoutubeClone
//
//  Created by minhdtn on 25/08/2022.
//

import Foundation

struct VideoManager {
    static func performRequest(with urlString: String, completion: @escaping([Video]) -> Void) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("DEBUG: \(String(describing: error))")
                    return
                }
                do {
                    var videos = [Video]()
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    for dictionary in json as! [[String: AnyObject]] {
                        let video = Video()
                        video.title = dictionary["title"] as? String
                        video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                        video.numberOfViews = dictionary["number_of_views"] as? NSNumber
                        let channel = Chanel()
                        let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                        channel.name = channelDictionary["name"] as? String
                        channel.profileImageName = channelDictionary["profile_image_name"] as? String
                        video.chanel = channel
                        videos.append(video)
                    }
                    completion(videos)
                } catch {
                    print("DEBUG: \(error)")
                }
            }
            task.resume()
        }
    }
    
//    func parseJSON(_ data: Data) -> Video {
//        let decoder = JSONDecoder()
//        do {
//            let video = Video()
//            let decodedData = try decoder.decode(Video.self, from: data)
//            let id = decodedData.weather[0].id
//            let temp = decodedData.main.temp
//            let name = decodedData.name
//
//
//
//        } catch {
//            delegate?.didFailWithError(error: error)
//            return nil
//        }
//    }
    
    
    
}
