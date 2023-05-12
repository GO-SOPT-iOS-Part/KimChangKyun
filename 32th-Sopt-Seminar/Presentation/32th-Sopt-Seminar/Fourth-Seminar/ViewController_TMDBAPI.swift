//
//  ViewController_TMDBAPI.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/12.
//

import UIKit

import SnapKit
import Then

class ViewController_TMDBAPI: UIViewController {

    private var movieArray: [MovieDataModel] = []
    
    private lazy var movieTableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        loadMovieInformation()
        setLayout()
    }

    private func loadMovieInformation() {
        
        MovieInformationService.get.loadMovieInformation(title: "Jack+Reacher") { response in
            switch response {
            case .success(let data):
                guard let data = data as? MovieInformation else { return }
                self.movieArray = data.results.map { movie in
                    MovieDataModel(posterPath: movie.posterPath, title: movie.title, realizeDate: movie.releaseDate, movieRating: movie.voteAverage)
                }
                self.movieTableView.reloadData()
                dump(data)
            default:
                return
            }
        }
    }
    
    func registerCell() {
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.className)
    }
    
    func setLayout() {
        
        view.addSubview(movieTableView)
        
        movieTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ViewController_TMDBAPI: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.className, for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        cell.movieDataBind(movieDataModel: self.movieArray[indexPath.row])
        return cell
    }
}
