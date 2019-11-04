//
//  ViewController.swift
//  ACProductPhotoGallery
//
//  Created by marcoaras on 11/04/2019.
//  Copyright (c) 2019 marcoaras. All rights reserved.
//

import UIKit
import ACProductPhotoGallery

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPhotoGalleryButtonTapped(_ sender: Any)
    {
        let images = [
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MWP22?wid=800&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1572296738299",
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MWP22_AV1?wid=800&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1571333755275",
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MWP22_AV2?wid=800&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1571333756123",
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MWP22_AV3?wid=1144&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1571333755813",
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MWP22_AV4?wid=1144&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1571333759946",
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-11-pro-select-2019-family_GEO_EMEA?wid=441&amp;hei=529&amp;fmt=jpeg&amp;qlt=95&amp;op_usm=0.5,0.5&amp;.v=1567812929188",
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-11-pro-max-gold-select-2019_GEO_EMEA?wid=470&hei=556&fmt=png-alpha&.v=1567808544078"]
        
        let vc = PPGZoomableImageSlider(images: images, currentIndex: nil, showPageIndex: true, closeButtonImage: UIImage(named: "closeBlack"))
        vc.PPGSliderDelegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

}

extension ViewController: PPGZoomableImageSliderDelegate {
    func selectedImageIndexChanged(index: Int) {
        print("Slider Index: \(index)")
    }
    
}

