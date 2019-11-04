//
//  PPGPhotoViewController.swift
//  Pods-ACProductPhotoGallery
//
//  Created by Aras Cglzn on 2.11.2019.
//

import UIKit
import Kingfisher

class PPGPhotoViewController: UIViewController {

    var heightPercentage: CGFloat = 16
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    
    weak var pageVC: PPGZoomableImageSlider!
    var photoIndex: Int = 0
    private var imageUrl = ""
    private var totalImageCount = 0
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        initUI()
    }
    
    convenience init(pageViewController: PPGZoomableImageSlider, index: Int, imageUrl: String, totalImageCount: Int) {
        self.init()
        
        pageVC = pageViewController
        self.photoIndex = index
        self.imageUrl = imageUrl
        self.totalImageCount = totalImageCount
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        setData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        scrollView.setZoomScale(1, animated: false)
    }
    
    func initUI()
    {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        tapGesture.numberOfTapsRequired = 2
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDownGestureAction))
        swipeGesture.direction = .down
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: getPromoHeight()))
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 4
        scrollView.delegate = self
        scrollView.addGestureRecognizer(tapGesture)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(swipeGesture)
        
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)
        
        addConstraints()
        
    }
    
    func addConstraints()
    {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //ScrollView
        let trailingConstraint1 = NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let leadingConstraint1 = NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let topConstraint1 = NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: scrollView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: getPromoHeight())
        
        //ImageView
        let trailingConstraint = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: scrollView, attribute: .trailing, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: scrollView, attribute: .bottom, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1, constant: 0)
        let centerX = NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: scrollView, attribute: .centerY, multiplier: 1, constant: 0)
        
        self.view.addConstraints([trailingConstraint1, leadingConstraint1, heightConstraint, topConstraint1, trailingConstraint, leadingConstraint, bottomConstraint, bottomConstraint, topConstraint, centerX, centerY])
    }
    
    private func setData()
    {
        
        let url = URL(string: imageUrl)
        imageView.kf.setImage(with: url, placeholder: pageVC.placeHolderImage, options: nil, progressBlock: nil, completionHandler: nil)
        pageVC.imageIndexLabel.text = "\(photoIndex + 1)/\(totalImageCount)"
    }
    
    @objc func handleDoubleTap(gestureRecognizer: UIGestureRecognizer)
    {
        
        if(self.scrollView.zoomScale > self.scrollView.minimumZoomScale)
        {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        }
        else
        {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }
    
    @objc func swipeDownGestureAction()
    {
        
        pageVC?.dismiss(animated: true, completion: nil)
    }

}

//MARK:- UIScrollViewDelegate
extension PPGPhotoViewController: UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
