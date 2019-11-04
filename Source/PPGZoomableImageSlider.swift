//
//  PPGZoomableImageSlider.swift
//  Pods-ACProductPhotoGallery
//
//  Created by Aras Cglzn on 2.11.2019.
//

import UIKit

public protocol PPGZoomableImageSliderDelegate {
    func selectedImageIndexChanged(index: Int)
}

public class PPGZoomableImageSlider: UIPageViewController {

    public var PPGSliderDelegate: PPGZoomableImageSliderDelegate?
    var placeHolderImage: UIImage?
    var images = [String]()
    var selectionColor: UIColor = .orange
    
    fileprivate var currentIndex: Int = 0{
        didSet{
            self.PPGSliderDelegate?.selectedImageIndexChanged(index: currentIndex)
            self.goCollectionView(scrollPosition: .centeredHorizontally)
        }
    }
    
    var showPageIndex = true
    let imageIndexLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
    let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    var bottomView: UIView!
    let cellId = "cellId"
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = UIColor.white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    let flow = UICollectionViewFlowLayout()
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required public init?(coder: NSCoder) {
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        basicSetUp()
    }
    
    
    public convenience init(images: [String], currentIndex: Int?, placeHolderImage: String = "", showPageIndex: Bool = true, selectionColor: UIColor = .orange, closeButtonImage: UIImage?) {
        self.init()
        
        self.selectionColor = selectionColor
        
        if placeHolderImage != "" {
            self.placeHolderImage = UIImage(named: placeHolderImage)
        }
        
        self.images = images
        if let _ = currentIndex {
            self.currentIndex = currentIndex!
        }
        self.showPageIndex = showPageIndex
        
        if closeButtonImage != nil {
            closeButton.setBackgroundImage(closeButtonImage, for: .normal)
        }
        
        basicSetUp()
    }
    
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.currentIndex = 0
    }
    
    public override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func goSpecificPage(){
        // 1
        if let viewController = getZoomedPhotoViewController(currentIndex) {
            let viewControllers = [viewController]
            // 2
            setViewControllers(viewControllers,
                               direction: .forward,
                               animated: false,
                               completion: nil)
        }
    }
    
    func basicSetUp() {
        
        dataSource = self
        delegate = self
        self.view.backgroundColor = UIColor.white
        goSpecificPage()
        setUpUI()
        
    }
    
    func setUpUI()
    {

        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(closeButton)
        if self.showPageIndex {
            self.view.addSubview(imageIndexLabel)
            self.view.bringSubview(toFront: imageIndexLabel)
        }
        
        self.view.bringSubview(toFront: closeButton)
        
        bottomView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: getBottomHeight()))
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PPGPhotoCell.self, forCellWithReuseIdentifier: cellId)
        bottomView.addSubview(collectionView)
        self.view.addSubview(bottomView)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        imageIndexLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        //Index Label
        let labelTrailingConstraint = NSLayoutConstraint(item: imageIndexLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -8)
        let labelBottomConstraint = NSLayoutConstraint(item: imageIndexLabel, attribute: .bottom, relatedBy: .equal, toItem: self.bottomLayoutGuide, attribute: .top, multiplier: 1, constant: -8)
        
        //Close Button
        let closeButtonLeadingConstraint = NSLayoutConstraint(item: closeButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 8)
        let closeButtonTopConstraint = NSLayoutConstraint(item: closeButton, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 8)
        let closeButtonWidthConstraint = NSLayoutConstraint(item: closeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 30)
        let closeButtonHeightConstraint = NSLayoutConstraint(item: closeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 30)
        
        //BottomView
        let bottomViewBottomConstraint = NSLayoutConstraint(item: bottomView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        let bottomViewLeadingConstraint = NSLayoutConstraint(item: bottomView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let bottomViewTrailingConstraint = NSLayoutConstraint(item: bottomView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let bottomViewHeightConstraint = NSLayoutConstraint(item: bottomView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: getBottomHeight())
        
        self.view.addConstraints([labelTrailingConstraint, labelBottomConstraint, closeButtonLeadingConstraint, closeButtonTopConstraint, closeButtonWidthConstraint, closeButtonHeightConstraint, bottomViewBottomConstraint, bottomViewLeadingConstraint, bottomViewTrailingConstraint, bottomViewHeightConstraint])
        
        setupCollection()
    }
    
    func setupCollection(){
        
        collectionView.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: bottomView.frame.height - 10).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: bottomView.frame.width).isActive = true
    }
    
    func goCollectionView(scrollPosition: UICollectionView.ScrollPosition){
        
        let indexPath = IndexPath(row: self.currentIndex, section: 0)
        UIView.animate(withDuration: 0.0, delay: 0.2 ,animations: {
            self.clearSelectedCells()
            self.collectionView.scrollToItem(at: indexPath, at: scrollPosition, animated: true)
        }) { _ in
            if let cell = self.collectionView.cellForItem(at: indexPath) as? ACZoomPhotoCell {
                cell.issSelected = true
            }
        }
    }
    
    func getZoomedPhotoViewController(_ index: Int) -> PPGPhotoViewController?
    {
        let page = PPGPhotoViewController(pageViewController: self, index: index, imageUrl: images[index], totalImageCount: images.count)
        return page
    }
    
    func clearSelectedCells(){
        for item in collectionView.visibleCells {
            if let cell = item as? PPGPhotoCell {
                cell.issSelected = false
            }
        }
    }
    
    @objc func closeButtonTapped()
    {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: UIPageViewControllerDataSource, UIPageViewControllerDelegate
extension PPGZoomableImageSlider: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    
    public func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as! PPGPhotoViewController
        let index = viewController.photoIndex
        if index == 0 {
            
            return getZoomedPhotoViewController(images.count - 1)
        }
        
        return getZoomedPhotoViewController(index - 1)
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as! PPGPhotoViewController
        let index = viewController.photoIndex
        if index == images.count - 1 {
            
            return getZoomedPhotoViewController(0)
        }
        
        return getZoomedPhotoViewController(index + 1)
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if !completed {
            return
        }
        
        self.currentIndex = (self.viewControllers?.first as! PPGPhotoViewController).photoIndex
        
    }
    
    // MARK: UIPageControl
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
}

//MARK: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension PPGZoomableImageSlider: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PPGPhotoCell
        cell.selectionColor = self.selectionColor
        cell.backgroundColor = .white
         cell.imageView.kf.setImage(with: URL(string: images[indexPath.row]), placeholder: self.placeHolderImage, options: nil, progressBlock: nil, completionHandler: nil)
        currentIndex == indexPath.row ? (cell.issSelected = true) : (cell.issSelected = false)
        
        return cell
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sizes = getCellWidthHeight()
        return CGSize(width: sizes.width, height: sizes.height)
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if images.count <= 6 && !UIDevice().isDeviceWith_XShape  {
            
            collectionView.isScrollEnabled = false
            let numberOfItems = collectionView.numberOfItems(inSection: 0)
            let combinedItemWidth:CGFloat = (CGFloat(numberOfItems) * flow.itemSize.width) + ((CGFloat(numberOfItems) - 1) * flow.minimumInteritemSpacing)
            let padding = (collectionView.frame.size.width - combinedItemWidth) / 2 - 20
            return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
            
        } else if images.count <= 2 && UIDevice().isDeviceWith_XShape{
            
            collectionView.isScrollEnabled = false
            return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
            
        }
        else{
            
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? PPGPhotoCell {
            self.clearSelectedCells()
            cell.setSelected()
        }
        
        self.currentIndex = indexPath.row
        self.goSpecificPage()
    }
    
}
