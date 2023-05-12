//
//  MovieTableViewCell.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/12.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    private let posterImg = UIImageView().then {
        $0.image = UIImage(named: "hypeBoy")
        $0.makeRounded(radius: 8)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "제목입니다"
        $0.textColor = .black
    }
    
    private let releaseDateLabel = UILabel().then {
        $0.text = "개봉일입니다"
        $0.textColor = .black
    }
    
    private let movieRatingLabel = UILabel().then {
        $0.text = "평점입니다"
        $0.textColor = .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func movieDataBind(movieDataModel: MovieDataModel) {
        if let imageURL = movieDataModel.posterPath {
            posterImg.getImageFromURL(imageURL)
        }
        titleLabel.text = movieDataModel.title
        releaseDateLabel.text = movieDataModel.realizeDate
        movieRatingLabel.text = "\(movieDataModel.movieRating)"
    }
    
    func setLayout() {
        addSubviews(posterImg, titleLabel, releaseDateLabel, movieRatingLabel)
        
        posterImg.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(240)
            $0.width.equalTo(160)
        }
        
        titleLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview().offset(50)
        }
        
        releaseDateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
        }
        
        movieRatingLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(releaseDateLabel.snp.bottom).offset(50)
        }
    }
}
