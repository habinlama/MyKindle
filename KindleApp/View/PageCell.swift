//
//  PageCell.swift
//  KindleApp
//
//  Created by Sujal on 7/26/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
class PageCell: UICollectionViewCell{
    var fillPageData: Pages? {
        didSet{
            textLabel.text = fillPageData?.text
        }
    }
    
    private let textLabel: UITextView = {
        let label = UITextView()
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel)
        //textLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        textLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 30).isActive = true
        textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
