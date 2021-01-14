//
//  NewsCVC.swift
//  DailyNews
//
//  Created by John Baer on 1/14/21.
//

import UIKit
import QuartzCore

class NewsCVC: UICollectionViewCell {
    static let identifier = "NewsCell"

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private let contentLabel: UILabel = {
        let swipeUpLabel = UILabel()
        swipeUpLabel.textAlignment = .left
        swipeUpLabel.textColor = .black
        swipeUpLabel.font = .boldSystemFont(ofSize: 15)
        swipeUpLabel.numberOfLines = 0
        return swipeUpLabel
    }()
    
    private let backgroundLabel: UILabel = {
        let backgroundLabel = UILabel()
        backgroundLabel.backgroundColor = .white
        backgroundLabel.alpha = 0.77
        backgroundLabel.layer.cornerRadius = 5
        backgroundLabel.layer.masksToBounds = true
        return backgroundLabel
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .blue
        contentView.clipsToBounds = true
    }
    
    
    public func configure(with newsData: NewsData){
        layoutSubviews()
        
        titleLabel.text = newsData.newsTitle
        contentLabel.text = newsData.newsContent
        
        contentView.addSubview(backgroundLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()

        let width = Int(contentView.frame.size.width)
        let height = Int(contentView.frame.size.height)
        let titleFontWidth = 300
        let swipeFontWidth = 300
        
        backgroundLabel.frame = CGRect(x: 0, y: height/2, width: height, height: 300)
        titleLabel.frame = CGRect(x: width/2-titleFontWidth/2, y: height/2, width: titleFontWidth, height: 240)
        contentLabel.frame = CGRect(x: width/2-swipeFontWidth/2, y: height-80, width: swipeFontWidth, height: 20)
    
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("Oops! RestaurantCVC error")
    }
    
    
    
}
