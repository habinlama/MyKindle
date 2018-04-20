//
//  FooterView.swift
//  KindleApp

import UIKit
class FooterView: UIView{
    private let segmentedControl: UISegmentedControl = {
       let segmentedControl = UISegmentedControl(items: ["Cloud","Device"])
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let gridButton: UIButton = {
       let gridButton = UIButton()
        gridButton.setImage(#imageLiteral(resourceName: "grid").withRenderingMode(.alwaysOriginal), for: .normal)
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        return gridButton
    }()
    
    private let sortButton: UIButton = {
       let sortButton = UIButton()
        sortButton.setImage(#imageLiteral(resourceName: "sort").withRenderingMode(.alwaysOriginal), for: .normal)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        return sortButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
        addSubview(segmentedControl)
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        addSubview(gridButton)
        gridButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        gridButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        gridButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        gridButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        addSubview(sortButton)
        sortButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        sortButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sortButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
