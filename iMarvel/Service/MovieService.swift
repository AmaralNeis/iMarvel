//
//  MovieService.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 19/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import Foundation
protocol MovieRequest {
    func get(page: Int, completion: @escaping (Any, Bool) -> Void)
    func filter(query: String, completion: @escaping (Any, Bool) -> Void)
    func getDetailMovie(idMovie: Int, completion: @escaping (Movie, Bool) -> Void)
}

class MovieService: MovieRequest {
    
    private let api: Api
    
    init() {
        self.api = Api()
    }
    
    func get(page: Int, completion: @escaping (Any, Bool) -> Void) {
        let url = EndPoints.getMovies(page).url
        DispatchQueue.global(qos: .background).async {
            self.get(url: url, completion: { (response, isSuccess) in
                completion(response, isSuccess)
            })
        }
    }
    
    func filter(query: String, completion: @escaping (Any, Bool) -> Void) {
        let url = EndPoints.filter(query).url
        DispatchQueue.global(qos: .background).async {
            self.get(url: url, completion: { (response, isSuccess) in
                completion(response, isSuccess)
            })
        }
    }
    
    private func get(url: String, completion: @escaping (Any, Bool) -> Void) {
        self.api.get(url: url, parameters: nil, success: { (_, _, response) in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(ApiResults<Movie>.self, from: response as! Data)
                completion(result, true)
            } catch {
                completion("", false)
            }
            
        }, failure: { (_, _) in
            completion("", false)
        })
    }
    
    func getDetailMovie(idMovie: Int, completion: @escaping (Movie, Bool) -> Void) {
        let url = EndPoints.getDetailMovie(idMovie).url
        DispatchQueue.global(qos: .background).async {
            self.api.get(url: url, parameters: nil, success: { (_, _, response) in
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode(Movie.self, from: response as! Data)
                    completion(result, true)
                } catch {
                    completion(Movie(), false)
                }
                
            }, failure: { (_, _) in
                completion(Movie(), false)
            })
        }
        
    }
}
