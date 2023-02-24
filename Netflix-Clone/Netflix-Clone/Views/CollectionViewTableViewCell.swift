//
//  CollectionViewTableViewCell.swift
//  Netflix-Clone
//
//  Created by Muhammed Enes Kılıçlı on 23.02.2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell  {

   static let  indetifier = "CollectionViewTableViewCell"
    private let collectinView: UICollectionView = {
        
      
        let layout  = UICollectionViewFlowLayout ()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout    )
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    } ()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor  = .systemPink
        contentView.addSubview(collectinView)
        
        collectinView.delegate = self
        collectinView.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectinView.frame = contentView.bounds
        
        
    }

}
    
    

extension CollectionViewTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource {
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath  )
        cell.backgroundColor = .green
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    
}
