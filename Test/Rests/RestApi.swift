//
//  RestApi.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import Foundation
import Alamofire

class RestApi {
    
    internal static let baseUrl = "https://api.documenu.com/v2/"
    
    internal static func callApi<T: Codable>(requestURL:String,
                                      method:HTTPMethod,
                                      parameters:Dictionary<String, Any>?,
                                      block: @escaping (T) -> Void) -> Void {
        
        let url = (baseUrl + requestURL).replacingOccurrences(of: " ", with: "%20")
        
        if isConnectedToInternet() {
            
            AF.request(url,
                       method: method,
                       parameters: parameters,
                       encoding: JSONEncoding.default,
                       headers: getHeaders()).responseString { (response) in
                        self.responseAction(response: response, block: block)
                       }
        }
    }
    
    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    internal static func responseAction<T: Codable>(response: AFDataResponse<String>,
                                             block: @escaping (T) -> Void) -> Void {
        if let value = response.value {
            print(value)
            if let r = decodeObject(T.self, withResponse: value) {
                block(r)
                return
            }
        }
    }
    
    internal static func decodeObject<T>(_ type: T.Type, withResponse response: String) -> T? where T:Decodable {
        
        do {
            let jsonData = response.data(using: .utf8)!
            let decoder = JSONDecoder()
            
            let product = try decoder.decode(T.self, from: jsonData)
            
            return product
        } catch let error {
            print(error)
            
            return nil
        }
    }
    
    private static func getHeaders() -> HTTPHeaders {
        return ["X-API-KEY" : "1e5aedf10c6e22aca98cf4ce458ed2a1"]
    }
}
