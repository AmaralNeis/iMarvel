//
//  MovieViewModel.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 20/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import Foundation


class MovieViewModel: MovieProtocol {
    
    
    private let movie: Movie
    
    init(with movie: Movie) {
        self.movie = movie
    }
    
    var idMovie: Int {
        return movie.idMovie ?? 0
    }
    
    var posterPath: String {
        if let poster = movie.posterPath {
            return String(format: "%@%@", Constants.baseUrlImage, poster)
        }
        return ""
    }
    
    var backdropPath: String {
        if let backdrop = movie.backdropPath {
            return String(format: "%@%@", Constants.baseUrlImage, backdrop)
        }
        return ""
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    var releaseDate: String {
        if let date = movie.releaseDate {
            return date.convertDateToPtBr
        }
        return ""
    }
    
    var voteCount: Int {
        return movie.voteCount ?? 0
    }
    
    var voteAverage: Double {
        if let value = movie.voteAverage {
            return  value/2
        }
        return 0.0
    }
    
    var overview: String {
        if let overview = movie.overview, !overview.isEmpty {
            return overview
        }
        
        return "Nenhuma informção sobre este filme"
    }
    
    var homepage: String {
        return movie.homepage ?? ""
    }
    
    var runtime: String {
        if let time = movie.runtime {
            return String(format: "%02d min.", time)
        }
        return "Não informado"
    }
//
    var genres: String {
        var genreResult = ""
        if let genres = movie.genres {
            for genre in genres {
                genreResult += genre.name!
                if movie.genres?.last?.name !=  genre.name {
                    genreResult += ", "
                }
            }
        }
        return genreResult
    }
    
}
