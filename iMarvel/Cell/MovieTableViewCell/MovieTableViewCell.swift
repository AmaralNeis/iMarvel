//
//  MovieTableViewCell.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 19/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

class MovieTableViewCell: UITableViewCell {
    
    // MARK: Outlet
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var voteCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(with movieModel: Movie) {
        let movie = MovieViewModel(with: movieModel)
        overviewLabel.text = movie.overview
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        cosmosView.rating = movie.voteAverage
        voteCountLabel.text =  String(format: "%02d", movie.voteCount)
        posterImageView.kf.setImage(with: URL(string: movie.posterPath))
        
    }
}
