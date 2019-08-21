//
//  MoviesTableViewController.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 20/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    // MARK: - Properties
    private var movies: [Movie] = []
    private let indetifier = "movieTableViewCell"
    private let service = MovieService()
    private var page = 1
    private var activityIndicator: ActivityIndicatorHelper!
    private var refresherControl: UIRefreshControl!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupActivityIndicator()
        setupTableView()
        getItems()
    }
    
    // MARK: - Methods
    private func setupActivityIndicator() {
        activityIndicator = ActivityIndicatorHelper(with: view)
        activityIndicator.start()
    }
    
    private func setupTableView() {
        registerCell()
        setupRefreshControl()
        setDelegateAndDataSource()
        self.tableView.addSubview(refresherControl)
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        self.tableView.tableFooterView = UIView()
        
    }
    
    private func setDelegateAndDataSource() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func registerCell() {
        let nibName = String(describing: MovieTableViewCell.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: indetifier)
    }
    
    private func setupRefreshControl() {
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        refresherControl = UIRefreshControl()
        refresherControl.attributedTitle = NSAttributedString(string: "Atualizando", attributes: attributes)
        refresherControl.tintColor = .gray
        refresherControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    private func getItems(isRefresher: Bool = false) {
        
        
        if !isConnectedToNetwork() {return}
        
        
        service.get(page: page) { [weak self] (response, isSuccess) in
            self?.dimmiss(isRefresher: isRefresher)
            if isSuccess {
                self?.setItens(apiResult: response as! ApiResults<Movie>)
            }
        }
    }
    
    private func setItens(apiResult: ApiResults<Movie>) {
        self.movies.append(contentsOf: apiResult.results)
        self.tableView.restore()
        self.tableView.reloadData()
    }
    
    private func isConnectedToNetwork() -> Bool {
        if !NetworkHelper.isConnectedToNetwork() {
            setMessageTable(title: "Sem conexão",
                            message: "Verifique sua conexão com a internet.")
            
            self.activityIndicator.stop()
            return false
        }
        return true
    }
    
    private func dimmiss(isRefresher: Bool) {
        if isRefresher {
            self.refresherControl.endRefreshing()
        } else {
            self.activityIndicator.stop()
        }
    }
    
    private func setMessageTable(title: String, message: String) {
        self.tableView.reloadData()
        self.tableView.setEmptyView(title: title, message: message)
    }
    
    private func resetValues() {
        self.movies = []
        self.page = 1
    }
    
    // MARK: - Actions
    @objc func refresh() {
        self.resetValues()
        if isConnectedToNetwork() {
            self.getItems(isRefresher: true)
            return
        }
        dimmiss(isRefresher: true)
    }
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender,  segue.identifier == "segueMovie"  {
            if let destinationVC = segue.destination as? DetailMovieViewController {
                destinationVC.idMovie = sender as! Int
            }
        }
    }

}

extension MoviesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indetifier, for: indexPath)
        
        if let cell = cell as? MovieTableViewCell, movies.count > indexPath.row {
            let movie = movies[indexPath.row]
            cell.setupCell(with: movie)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movies.count - 4 {
            page += 1
            getItems()
        }
    }
}
extension MoviesTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueMovie", sender:  movies[indexPath.row].idMovie)
    }
}

extension MoviesTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            self.activityIndicator.start()            
            service.filter(query: searchText) { [weak self] (response, isSuccess) in
                self?.dimmiss(isRefresher: false)
                if isSuccess {
                    self?.resetValues()
                    let result = response as! ApiResults<Movie>
                    if result.results.isEmpty {
                        self?.setMessageTable(title: "Filme não encontrado",
                                              message: "Realizamos uma busca em nosso repositório e não encontramos este filme.")
                    } else {
                        self?.setItens(apiResult: result)
                    }
                    
                }
            }
        } else if searchText.isEmpty {
            self.resetValues()
            self.getItems()
        }
    }
    
}
