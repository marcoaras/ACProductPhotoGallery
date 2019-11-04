# ACProductPhotoGallery 

[![Version](https://img.shields.io/cocoapods/v/ACProductPhotoGallery.svg?style=flat)](https://cocoapods.org/pods/ACProductPhotoGallery)
[![License](https://img.shields.io/cocoapods/l/ACProductPhotoGallery.svg?style=flat)](https://cocoapods.org/pods/ACProductPhotoGallery)
[![Platform](https://img.shields.io/cocoapods/p/ACProductPhotoGallery.svg?style=flat)](https://cocoapods.org/pods/ACProductPhotoGallery)

**ACProductPhotoGallery** was written by Aras Cagliuzun for patirti

`ACProductPhotoGallery` is a modern looking photo gallery written in `Swift` for `iOS`. `ACProductPhotoGallery` can handle your remote images by using `Kingfisher` to show zoomable images. Also `ACProductPhotoGallery` has navitaion section to select images at the bottom of big image.


## Screen Shots

![](https://user-images.githubusercontent.com/12196584/68140086-4313c300-ff3c-11e9-87b5-d82948a88483.png) ![](https://user-images.githubusercontent.com/12196584/68140523-04323d00-ff3d-11e9-997c-36d54db77105.png)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

platform :ios, '9.0'

## Usage

```swift
import ACProductPhotoGallery
```

```swift
let images = [
"http://www.remotedomain.com/imag1.jpg",
"http://www.remotedomain.com/image2.jpg"]

let vc = PPGZoomableImageSlider(images: images, currentIndex: nil, showPageIndex: true, closeButtonImage: UIImage(named: "closeBlack"))
vc.PPGSliderDelegate = self
vc.modalPresentationStyle = .fullScreen
present(vc, animated: true, completion: nil)
```

## Installation

ACProductPhotoGallery is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ACProductPhotoGallery'
```

## Author

(marcoaras) Aras Cagliuzun, cagliuzun.aras@gmail.com
http://linkedin.com/in/aras-cagliuzun-99376221

## License

ACProductPhotoGallery is available under the MIT license. See the LICENSE file for more info.

The MIT License (MIT)

Copyright (c) 2019 Aras Cagliuzun

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

