//
//  ACZoomPhotoCell.swift
//  Pods-ACProductPhotoGallery
//
//  Created by Aras Cglzn on 2.11.2019.
//

import UIKit

class ACZoomPhotoCell: UICollectionViewCell {
    
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
    
    
    let selectionView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    func setSelected() {
        selectionView.layer.borderColor = selectionColor.cgColor
        imageView.alpha = 1
    }
    
    func removeSelected() {
        selectionView.layer.borderColor = UIColor.gray.cgColor
        imageView.alpha = 0.7
    }
    
    func setupView(){
        
        imageView.alpha = 0.7
        selectionView.translatesAutoresizingMaskIntoConstraints = false
        selectionView.layer.borderColor = UIColor.gray.cgColor
        selectionView.layer.borderWidth = 2.0
        
        selectionView.addSubview(imageView)
        addSubview(selectionView)
        
        selectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        selectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        selectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        selectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: selectionView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: selectionView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: selectionView.widthAnchor, constant: -2).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
