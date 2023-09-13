//
//  ViewModel.swift
//  202309StanleyGodfrey-NYCSchools
//
//  Created by Uche Godfrey on 9/10/23.
//

import Foundation

struct UrlStruct{
    let schoolUrl = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    let satUrl = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
}

class SchoolViewModel{
    let url = UrlStruct()
    var schools = [School]()
    lazy var schoolSats = [SchoolSat]()
    
    func getSchools(url:String) async {
        guard let _url = URL(string: url) else{ return }
      
            do{
                self.schools = try await NetworkManager.taskForGETRequest(url: _url, responseType: Schools.self)
            }catch {
                print(error.localizedDescription)
            }
    }
    func getSats(url:String) async {
        guard let _url = URL(string: url) else{return}
        do{
            self.schoolSats =   try await NetworkManager.taskForGETRequest(url: _url, responseType: SchoolSats.self)
            print(self.schoolSats)
        }catch {            print(error.localizedDescription)
        }
    }
    func getSat(dbn:String)->SchoolSat?{
        return self.schoolSats.first(where: { ($0.dbn ?? " ") == dbn  })
    }
}

        
class NetworkManager {
    
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type) async throws -> ResponseType {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let (data, response) = try await session.data(for: request)
        let jsonDecoder = JSONDecoder()
        let result = try jsonDecoder.decode(ResponseType.self, from: data)
        return result
    }
}
    
