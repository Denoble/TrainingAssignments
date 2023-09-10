//
//  ViewModel.swift
//  202309StanleyGodfrey-NYCSchools
//
//  Created by Uche Godfrey on 9/10/23.
//

import Foundation

class SchoolViewModel{
    public  var schools :Schools = [School]()
    let url = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    func getSchools(url:String,completionHandler: @escaping ([School], Error?) -> Void) {
        guard let _url = URL(string: url) else{return}
        NetworkManager.taskForGETRequest(url: _url, responseType: Schools.self) { result in
            switch result {
            case .success(let schools): completionHandler(schools, nil)
            case .failure(let error): completionHandler([],error)
            default:  break
            }
            
        }
    }
}
        
class NetworkManager {
    
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (Result<ResponseType, Error>) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(.success( responseObject))
                }
            } catch {
                DispatchQueue.main.async {
                    //show error as alertDialog m
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
        
        return task
    }
    class func getSchools(url:String,completionHandler: @escaping ([School], Error?) -> Void) {
        guard let _url = URL(string: url) else{return}
        taskForGETRequest(url: _url, responseType: Schools.self) { result in
            switch result {
            case .success(let schools): completionHandler(schools, nil)
            case .failure(let error): completionHandler([],error)
            default:  break
            }
        }
        
    }
}
        
