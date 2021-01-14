//
//  NewsPage.swift
//  DailyNews
//
//  Created by John Baer on 1/14/21.
//

import Foundation

class NewsData{
    var newsTitle: String
    var newsContent: String
    var newsPublication: String
    
    init(newsTitle: String, newsContent: String, newsPublication: String) {
        self.newsTitle = newsTitle
        self.newsContent = newsContent
        self.newsPublication = newsPublication
    }
    
}
