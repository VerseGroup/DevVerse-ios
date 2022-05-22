//
//  GitHubService.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import Foundation
import Alamofire

class GitHubService: ObservableObject {
    
    @Published var token: String?
    
    // returns OAuth token
    func handleOAuthURL(url: URL) {
        let urlString = url.absoluteString
        let code = String(urlString.dropFirst(17))
        print(code)
        getToken(code: code)
    }
    
    // returns OAuth token
    func getToken(code: String) {
        let params: Parameters = [
            "client_id": clientId,
            "client_secret": clientSecret,
            "code": code
        ]
        
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        
        AF.request("https://github.com/login/oauth/access_token", method: .post, parameters: params, headers: headers)
        //                            .cURLDescription { description in
        //                                print(description)
        //                            }
        //                            .response(completionHandler: { data in
        //                                debugPrint(data)
        //                            })
            .responseDecodable(of: Token.self) { response in
                print(response.value.debugDescription)
                self.token = response.value?.accessToken
            }
        
        // async await
        //        let dataTask = AF.request("https://github.com/login/oauth/access_token", method: .post, parameters: params, headers: headers)
        //        //                            .cURLDescription { description in
        //        //                                print(description)
        //        //                            }
        //            .serializingDecodable(Token.self)
        //
        //        do {
        //            let authToken = try await dataTask.value.accessToken
        //            print(authToken)
        //            return authToken
        //        } catch {
        //            print(error)
        //        }
    }
}

struct Token: Codable {
    var accessToken: String
    var scope: String
    var tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case scope
        case tokenType = "token_type"
    }
}
