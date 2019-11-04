//
//  PPGPhotoCell.swift
//  Pods-ACProductPhotoGallery
//
//  Created by Aras Cglzn on 2.11.2019.
//

import UIKit

class PPGPhotoCell: UICollectionViewCell {
    
    var issSelected: Bool = false {
        didSet{
            if self.issSelected {
                setSelected()
            }else{
                removeSelected()
            }
        }
    }
    
    var selectionColor: UIColor = .orange
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    let baseView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    func setSelected() {
        baseView.backgroundColor = selectionColor
        imageView.alpha = 1
    }
    
    func removeSelected() {
        baseView.backgroundColor = .gray
        imageView.alpha = 0.7
    }
    
    func setupView(){
        
        imageView.alpha = 0.7
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.backgroundColor = .gray
        
        baseView.addSubview(imageView)
        addSubview(baseView)
        
        baseView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        baseView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        baseView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        baseView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: baseView.widthAnchor, constant: -2).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
