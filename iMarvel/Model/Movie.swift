//
//  Movie.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 19/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import Foundation

protocol MovieProtocol {
    var idMovie: Int { get }
    var posterPath: String { get }
    var backdropPath: String { get }
    var title: String { get }
    var releaseDate: String { get }
    var voteCount: Int { get }
    var voteAverage: Double { get }
    var overview: String { get }
    var homepage: String { get }
    var runtime: String { get }
    var genres: String { get }
}

struct Movie: Codable {
    var idMovie: Int?
    var posterPath: String?
    var backdropPath: String?
    var title: String?
    var releaseDate: String?
    var voteCount: Int?
    var voteAverage: Double?
    var overview: String?
    var homepage: String?
    var runtime: Int?
    var genres: [Genre]?
    
    private enum CodingKeys: String, CodingKey {
        case idMovie = "id", posterPath,
        backdropPath, title, releaseDate,
        voteCount, voteAverage, overview,
        homepage, genres, runtime
    }
}
