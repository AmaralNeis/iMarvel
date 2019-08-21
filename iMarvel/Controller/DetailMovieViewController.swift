//
//  DetailMovieViewController.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 20/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import UIKit
import Kingfisher

class DetailMovieViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // MARK: - Properties
    var idMovie: Int!
    private lazy var activityIndicator: ActivityIndicatorHelper = {
        return ActivityIndicatorHelper(with: self.view)
    }()
    private let service = MovieService()
    

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.hiddenDetailView(isHidden: true)
        activityIndicator.start()
        self.service.getDetailMovie(idMovie: idMovie) { [weak self] (movie, isSuccess) in
            DispatchQueue.main.async {
                self?.setValues(with: MovieViewModel(with: movie))
            }
        }
        
    }
    
    // MARK: - Methods
    private func hiddenDetailView(isHidden: Bool) {
        detailView.isHidden = isHidden
    }
    
    private func setValues(with movie: MovieViewModel) {
        hiddenDetailView(isHidden: false)
        activityIndicator.stop()
        runtimeLabel.text = movie.runtime
        overviewLabel.text = movie.overview
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        genresLabel.text = movie.genres
        backdropImageView.kf.setImage(with: URL(string: movie.backdropPath))
        posterImageView.kf.setImage(with: URL(string: movie.posterPath))
    
    }
    
    // MARK: - Actions
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
