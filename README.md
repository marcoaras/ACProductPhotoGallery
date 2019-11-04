# ACProductPhotoGallery

[![CI Status](https://img.shields.io/travis/marcoaras/ACProductPhotoGallery.svg?style=flat)](https://travis-ci.org/marcoaras/ACProductPhotoGallery)
[![Version](https://img.shields.io/cocoapods/v/ACProductPhotoGallery.svg?style=flat)](https://cocoapods.org/pods/ACProductPhotoGallery)
[![License](https://img.shields.io/cocoapods/l/ACProductPhotoGallery.svg?style=flat)](https://cocoapods.org/pods/ACProductPhotoGallery)
[![Platform](https://img.shields.io/cocoapods/p/ACProductPhotoGallery.svg?style=flat)](https://cocoapods.org/pods/ACProductPhotoGallery)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## USAGE

```swift
import ACProductPhotoGallery
```

```swift
let images = [
"http://www.remotedomain.com/imag1.jpg",
"http://www.remotedomain.com/image2.jpg"]

let vc = PPGZoomableImageSlider(images: images, currentIndex: nil, showPageIndex: true, closeButtonImage: UIImage(named: "closeBlack"))
vc.PPGSliderDelegate = self
present(vc, animated: true, completion: nil)
```

## Installation

ACProductPhotoGallery is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ACProductPhotoGallery'
```

## Author

(marcoaras) Aras Cglzn, cagliuzun.aras@gmail.com

## License

ACProductPhotoGallery is available under the MIT license. See the LICENSE file for more info.

The MIT License (MIT)

Copyright (c) 2019 Aras Cagliuzun

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
