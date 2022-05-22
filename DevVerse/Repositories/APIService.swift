//
//  APIService.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import Foundation
import Alamofire

class APIService: ObservableObject {
    
    let baseURL: String = "https://devverse-server.herokuapp.com"
    
    @MainActor
    func signIn(token: String) async -> User {
        
        let params: [String: String] = [
            "oauth_token": token
        ]
        
        
        AF.request(baseURL + "/signIn", method: .post, parameters: params, encoding: JSONEncoding.default)
                                    .cURLDescription { description in
                                        print("curl: " + description)
                                    }
                                    .response(completionHandler: { data in
                                        debugPrint("data: " + data.debugDescription)
                                    })
        
        let dataTask = AF.request(baseURL + "/signIn", method: .post, parameters: params, encoding: JSONEncoding.default)
            .serializingDecodable(User.self)
        
        let response = await dataTask.response
        debugPrint(response.data)
        
        do {
            return try await dataTask.value
        } catch {
            print("error: \(error)")
        }
        
        return User(id: 0, username: "", email: "", phone: "", name: "", token: "")
    }
    
    // make sure phone is properly formatted with +1##########
    @MainActor
    func signUp(token: String, phone: String) async -> User {
        
        let params: [String: String] = [
            "oauth_token": token,
            "phone_number": phone
        ]
        
        AF.request(baseURL + "/addUser", method: .post, parameters: params, encoding: JSONEncoding.default)
                                    .cURLDescription { description in
                                        print(description)
                                    }
                                    .response(completionHandler: { data in
                                        debugPrint(data)
                                    })
        
        let dataTask = AF.request(baseURL + "/addUser", method: .post, parameters: params, encoding: JSONEncoding.default)
            .serializingDecodable(User.self)
        
        let response = await dataTask.response
        debugPrint(response.data)
        
        do {
            return try await dataTask.value
        } catch {
            print("error: \(error)")
        }
        
        return User(id: 0, username: "", email: "", phone: "", name: "", token: "")
    }
}
