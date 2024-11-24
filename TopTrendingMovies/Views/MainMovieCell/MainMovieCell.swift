//
//  MainMovieCell.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 22.11.2024.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    private let build = MainMovieCellView()
    
    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    
    var backView: UIView!
    var image: UIImageView!
    var name: UILabel!
    var date: UILabel!
    var rate: UILabel!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCellItems()
        backView.addBorder(color: .label, width: 1)
        roundEdges()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCellItems()
        backView.addBorder(color: .label, width: 1)
        roundEdges()
    }

    
    private func setView() {
        backView = build.backView
        contentView.addSubview(backView)
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setImage() {
        image = build.imageView
        backView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 8),
            image.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            image.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 1.5)
            
        ])
    
    }
    
    private func setNameLabel() {
        name = build.nameLabel
        backView.addSubview(name)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: backView.topAnchor),
            name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            name.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8)
        ])
    
    }
    
    
    private func setDateLabel() {
        date = build.dateLabel
        backView.addSubview(date)
        
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: name.bottomAnchor,constant: 8),
            date.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            date.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8)
        ])
    
    }
    
    private func setRateLabel() {
        rate = build.rateLabel
        backView.addSubview(rate)
        
        NSLayoutConstraint.activate([
            rate.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -8),
            rate.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            rate.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8),
            rate.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 8)
        ])
    
    }
    
    private func setCellItems() {
        setView()
        setImage()
        setNameLabel()
        setDateLabel()
        setRateLabel()
    
    }
    
    private func roundEdges() {
        backView.round()
        image.round(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.name.text = viewModel.title
        self.date.text = viewModel.date
        self.rate.text = viewModel.rating
        self.image.sd_setImage(with: viewModel.imageUrl)
        
    }
}
