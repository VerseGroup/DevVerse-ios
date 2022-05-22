//
//  APIRepository.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import Foundation
import Alamofire

class APIRepository: ObservableObject {
    var authService: AuthService = AuthService.instance
    
    let baseURL = "https://devverse-server.herokuapp.com"
    
    @Published var repos: [Repository] = []
    
    // MARK: GITHUB FUNCTIONS
    
    //    func getUser() {
    //        let params: [String: String] = [
    //            "endpoint": "user",
    //            "method": "GET",
    //            "oauth_token": authService.user?.token ?? "AAAAAAAAA"
    //        ]
    //
    //        AF.request(baseURL + "/relay", method: .post, parameters: params, encoding: JSONEncoding.default)
    //            .cURLDescription { description in
    //                print(description)
    //            }
    //            .response(completionHandler: { data in
    //                debugPrint("LOL: \(data.debugDescription)")
    //            })
    //
    //        let dataTask = AF.request(baseURL + "/relay", method: .post, parameters: params, encoding: JSONEncoding.default)
    //            .serializingDecodable(User.self)
    //
    //        let response = await dataTask.response
    //        debugPrint(response.data)
    //
    //        do {
    //            return try await dataTask.value
    //        } catch {
    //            print("error: \(error)")
    //        }
    //
    //        return User(id: 0, username: "", email: "", phone: "", name: "", token: "")
    //    }
    
    func getRepos() async {
        let params: [String: String] = [
            "endpoint": "users/\(authService.user?.username ?? "")/repos",
            "method": "GET",
            "oauth_token": authService.user?.token ?? "AAAAAAAAA"
        ]
        
        AF.request(baseURL + "/relay", method: .post, parameters: params, encoding: JSONEncoding.default)
            .cURLDescription { description in
                print(description)
            }
            .response(completionHandler: { data in
                debugPrint("LOL: \(data.debugDescription)")
            })
        
        let dataTask = AF.request(baseURL + "/relay", method: .post, parameters: params, encoding: JSONEncoding.default)
            .serializingDecodable(GitHubMessage.self)
        
        let response = await dataTask.response
        debugPrint(response.data)
        
        do {
            let response = try await dataTask.value.response.data(using: .utf8)!
            
            let decoder = JSONDecoder()
            let product = try decoder.decode([Repository].self, from: response)
            repos = product
            debugPrint("product:::::::: \(product)")
        } catch {
            print("error: \(error)")
        }
    }
    
    func addHook(repo: String) {
        
        let params: [String: String] = [
            "oauth_token": authService.user?.token ?? "AAAAAAAAA",
            "repo": repo
        ]
        
        
        AF.request(baseURL + "/addWebhook", method: .post, parameters: params, encoding: JSONEncoding.default)
            .cURLDescription { description in
                print(description)
            }
            .response(completionHandler: { data in
                debugPrint("LOL: \(data.debugDescription)")
            })
    }
    
    func addTask()
}
