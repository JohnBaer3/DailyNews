//
//  ViewController.swift
//  DailyNews
//
//  Created by John Baer on 1/11/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //First, make a collectionView that you can scroll through
    private var collectionView: UICollectionView?
    var newsData: [NewsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateNewsData()
        
        configureCollectionView()
    }
    
    func configureCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.size.width,
                                 height: view.frame.size.height-10)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(NewsCVC.self, forCellWithReuseIdentifier: NewsCVC.identifier)
        collectionView?.isPagingEnabled = true
        collectionView?.dataSource = self
        collectionView?.delegate = self
        view.addSubview(collectionView!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newsCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCVC.identifier,
                                                          for: indexPath) as! NewsCVC
        newsCell.configure(with: newsData[indexPath.row])
        return newsCell
    }


    
    
    
    
    
    func populateNewsData(){
        newsData.append(NewsData(newsTitle: "bla", newsContent: "ble", newsPublication: "blo"))
    }
}

