//
//  GitHubService.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import Foundation
import Alamofire

class GitHubService: ObservableObject {
    
    func handleOAuthURL(url: URL) {
        let urlString = url.absoluteString
        let code = String(urlString.dropFirst(17))
        print(code)
        getToken(code: code)
    }
    
    func getToken(code: String) {
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        let params: Parameters = [
            "client_id": clientId,
            "client_secret": clientSecret,
            "code": code
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
            }
        
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
