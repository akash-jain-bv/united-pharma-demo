//
//  CallAPI.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 13/10/23.
//

import Foundation
//MARK:- API Call Class
class CallAPI{
    static let shared = CallAPI()
    private init(){}
    //MARK:- Fetchdata function
    func fetchData<T: Decodable>(pageUrl : String,dataModel : T.Type,completionHandler : @escaping (_ jsonData: T?)->()){
        if let url = URL(string : pageUrl){
//            var request = URLRequest(url: url)
//                request.httpMethod = "GET"
//                request.setValue("", forHTTPHeaderField: "authKey")
//                request.setValue("sha256", forHTTPHeaderField: "apiAuthType")
            let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard let data = data else{
                    if error == nil{
                        print("unknown error")
                    }
                    return
                }
                let httpResponse = (response as! HTTPURLResponse)
                guard (200...299) ~= httpResponse.statusCode else{
                    print("StatusCode \(httpResponse.statusCode)")
                    return
                }
                do{
                    let jsonData = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(jsonData)
                }
                catch{
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    }
    //MARK:-Download Image function
    func downloadImage(imageURL: URL,completionHandler: @escaping (Data) -> ()){
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let imagedirectory = directory!.appendingPathComponent(imageURL.lastPathComponent)
        if FileManager.default.fileExists(atPath: imagedirectory.path){
            let imageData = try! Data(contentsOf: imagedirectory)
            completionHandler(imageData)
        }
        else{
            let task = URLSession.shared.dataTask(with: imageURL){
                (data, response, error) in
                guard let data = data else{
                    print("error")
                    return
                }
                do{
                    try data.write(to: imagedirectory)
                }
                catch{
                    print("error")
                }
            }
            task.resume()
        }
    }
}
 
