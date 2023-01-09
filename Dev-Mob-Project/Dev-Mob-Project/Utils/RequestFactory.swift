//
//  RequestFactory.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 12/12/22.
//

import Foundation

struct Response: Codable {
    let id: String
    let deleted: Bool
}
struct ErrorResponse: Codable {
    let error: String
}
enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}
enum CustomError: Error {
    case requestError
    case statusCodeError
    case parsingError
}

// Request Factory
protocol RequestFactoryProtocol {
    func createRequest(urlStr: String, requestType: RequestType, params: [String]?) -> URLRequest
    func getScheduleList(callback: @escaping ((errorType: CustomError?, errorMessage: String?), [Schedule]?) -> Void)
}

private let scheduleUrlStr = "https://api.airtable.com/v0/appLxCaCuYWnjaSKB/%F0%9F%93%86%20Schedule"
private let speakerUrlStr  = "https://api.airtable.com/v0/appLxCaCuYWnjaSKB/%F0%9F%8E%A4%20Speakers"

class RequestFactory: RequestFactoryProtocol {
    
    internal func createRequest(urlStr: String, requestType: RequestType, params: [String]?) -> URLRequest {
        var url: URL = URL(string: urlStr)!
        if let params = params {
            var urlParams = urlStr
            for param in params {
                urlParams = urlParams + "/" + param
            }
            print(urlParams)
            url = URL(string: urlParams)!
        }
 
        var request = URLRequest(url: url)
        request.timeoutInterval = 100
        request.httpMethod = requestType.rawValue
 
        let accessToken = "keymaCPSexfxC2hF9"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
 
        return request
    }
 
    func getScheduleList(callback: @escaping ((errorType: CustomError?, errorMessage: String?), [Schedule]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr: scheduleUrlStr, requestType: .get, params: nil)) {
            (data, response, error) in
            if let data = data, error == nil {
                if let responseHttp = response as? HTTPURLResponse {
                    if responseHttp.statusCode == 200 {
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .formatted(dateFormatter)
                        
                        if let response = try? decoder.decode(RecordsSchedule.self, from: data) {
                                callback((nil, nil), response.records)
                        }
                        else {
                            callback((CustomError.parsingError, "parsing error"), nil)
                        }
                    }
                    else {
                        callback((CustomError.statusCodeError, "status code: \(responseHttp.statusCode)"), nil)
                    }
                }
            }
            else {
                callback((CustomError.requestError, error.debugDescription), nil)
            }
            
        }
        task.resume()
    }
    
    func getSpeakerList(callback: @escaping ((errorType: CustomError?, errorMessage: String?), [Speaker]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr: speakerUrlStr, requestType: .get, params: nil)) {
            (data, response, error) in
            if let data = data, error == nil {
                if let responseHttp = response as? HTTPURLResponse {
                    if responseHttp.statusCode == 200 {
                        
                        let decoder = JSONDecoder()
                        
                        if let response = try? decoder.decode(RecordsSpeaker.self, from: data) {
                            callback((nil, nil), response.records)
                        }
                        else {
                            callback((CustomError.parsingError, "parsing error"), nil)
                        }
                    }
                    else {
                        callback((CustomError.statusCodeError, "status code: \(responseHttp.statusCode)"), nil)
                    }
                }
            }
            else {
                callback((CustomError.requestError, error.debugDescription), nil)
            }
            
        }
        task.resume()
    }
}
