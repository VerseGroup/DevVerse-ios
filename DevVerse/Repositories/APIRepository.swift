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
    @Published var ideas: [Idea] = []
    
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
    
    @MainActor
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
    
    func addIdea(ideaName: String, ideaDescription: String) async {
        let params: [String: String] = [
            "idea_name": ideaName,
            "idea_description": ideaDescription,
            "oauth_token": authService.user?.token ?? "AAAAAAAAA"
        ]
        
        AF.request(baseURL + "/addIdea", method: .post, parameters: params, encoding: JSONEncoding.default)
            .cURLDescription { description in
                print(description)
            }
            .response(completionHandler: { data in
                debugPrint("LOL: \(data.debugDescription)")
            })
        
        await self.getIdeas()
    }
    
    @MainActor
    func getIdeas() async {
        let params: [String: String] = [
            "oauth_token": authService.user?.token ?? "AAAAAAAAA"
        ]
        
        
        AF.request(baseURL + "/viewIdeas", method: .post, parameters: params, encoding: JSONEncoding.default)
            .cURLDescription { description in
                print(description)
            }
            .response(completionHandler: { data in
                debugPrint("LOL: \(data.debugDescription)")
            })
        
        let dataTask = AF.request(baseURL + "/viewIdeas", method: .post, parameters: params, encoding: JSONEncoding.default)
            .serializingDecodable([Idea].self)
        
        do {
            let response = try await dataTask.value
            ideas = response
        } catch {
            print("error: \(error)")
        }
    }
    
    func editIdea(idea: Idea) {
        let params: [String: Any?] = [
            "idea_id": idea.id,
            "idea_name": idea.name,
            "idea_description": idea.description,
            "idea_completed": !idea.completed,
            "user_id": authService.user?.id ?? -100
        ]
        
        AF.request(baseURL + "/editIdea", method: .post, parameters: params, encoding: JSONEncoding.default)
            .cURLDescription { description in
                print(description)
            }
            .response(completionHandler: { data in
                debugPrint("LOL: \(data.debugDescription)")
            })
    }
}
