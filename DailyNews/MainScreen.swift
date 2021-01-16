//
//  ViewController.swift
//  DailyNews
//
//  Created by John Baer on 1/11/21.
//

import UIKit

class MainScreen: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
    @IBOutlet var topCompletionBar: [UIView]!
    
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
        layout.itemSize = CGSize(width: view.frame.size.width-5,
                                 height: view.frame.size.height-10)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(NewsCVC.self, forCellWithReuseIdentifier: NewsCVC.identifier)
        collectionView?.isPagingEnabled = true
        collectionView?.dataSource = self
        collectionView?.delegate = self
        view.addSubview(collectionView!)
        for bar in topCompletionBar{
            bar.superview?.bringSubviewToFront(bar)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newsCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCVC.identifier,
                                                          for: indexPath) as! NewsCVC
        newsCell.configure(with: newsData[indexPath.row])
        newsCell.tag = indexPath.row
        return newsCell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Protocol to that specific
    }
    
    
    
    
    
    

    
    func populateNewsData(){
        newsData.append(NewsData(newsTitle: "Dr. Harold Bornstein, Trump's former personal physician, dead at 73",
                                 newsContent: "Bornstein's death was announced on Thursday in a paid notice in The New York Times. \n \n The notice did not give a cause or say where he died, but said he passed away last Friday.", //\n Bornstein had served as Trump's physician for more than three decades, a position that thrust him into the national spotlight during and after the 2016 campaign \n
                                 newsPublication: "theWashingtonPostLogo",
                                 newsImage: "trumpDoctor"))
        newsData.append(NewsData(newsTitle: "Surreal 'dome fountain' of lava bubbles up in Hawaii",
                                 newsContent: "US Geological Survey officials captured what appears to be a 'dome fountain' of lava. \n \n  Found in the Halema'uma'u crater of Hawaii's Kilauea volcano",
                                 newsPublication: "bloombergNewsLogo",
                                 newsImage: "lavaThing"))
        newsData.append(NewsData(newsTitle: "New unemployment claims jump to nearly 1 million, the highest level since August",
                                 newsContent: "The number of new unemployment claims filed jumped by 181,000 to 965,000 last week, the largest increase since the beginning of the pandemic. \n \n It was the highest number of new unemployment claims since August.", // \n An additional 284,000 claims were filed for the Pandemic Unemployment Assistance, the insurance for gig and self-employed workers.
                                 newsPublication: "yahooNewsLogo",
                                 newsImage: "personWalking"))
    }
}


extension MainScreen: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let collectionViewPos = collectionView?.visibleCells.first{
            for i in 0 ..< collectionViewPos.tag{
                topCompletionBar[i].backgroundColor = .darkGray
            }
            for i in collectionViewPos.tag ..< 5{
                topCompletionBar[i].backgroundColor = .systemGray3
            }
        }
    }
}
