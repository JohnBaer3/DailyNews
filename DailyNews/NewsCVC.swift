//
//  NewsCVC.swift
//  DailyNews
//
//  Created by John Baer on 1/14/21.
//

import UIKit

class NewsCVC: UICollectionViewCell {
    static let identifier = "NewsCell"

    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 40)
        titleLabel.text = "FOOVER"
        return titleLabel
    }()
    
    private let swipeUpLabel: UILabel = {
        let swipeUpLabel = UILabel()
        swipeUpLabel.textAlignment = .center
        swipeUpLabel.textColor = .white
        swipeUpLabel.font = .boldSystemFont(ofSize: 20)
        swipeUpLabel.text = "Swipe up to start!"
        return swipeUpLabel
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .black
        contentView.clipsToBounds = true
    }
    
    
    public func configure(with newsData: NewsData){
        layoutSubviews()
        contentView.addSubview(titleLabel)
        contentView.addSubview(swipeUpLabel)
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let width = Int(contentView.frame.size.width)
        let height = Int(contentView.frame.size.height)
        let titleFontWidth = 30
        let swipeFontWidth = 30
        
        titleLabel.frame = CGRect(x: width/2-titleFontWidth/2, y: height/2, width: titleFontWidth, height: 40)
        swipeUpLabel.frame = CGRect(x: width/2-swipeFontWidth/2, y: height-80, width: swipeFontWidth, height: 20)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Oops! RestaurantCVC error")
    }
    
    
    
}
