# STKitSwift

<p align="center">
<img src="Resources/Banner.png" alt="STKitSwift Banner">
</p>

[![Platform](https://img.shields.io/cocoapods/p/STKitSwift.svg?style=flat)](https://github.com/STShenZhaoliang/STKitSwift)
![Version](https://img.shields.io/cocoapods/v/STKitSwift.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Language](https://img.shields.io/badge/language-Swift%205.0-orange.svg)](https://swift.org/)
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/STShenZhaoliang/STKitSwift/blob/master/LICENSE)
STKitSwift is a collection of useful classes, structs and extensions to **develop Apps faster**.

Installing and Usage
====================

```ruby

    platform :ios, '12.0'
    xcodeproj 'Project.xcodeproj'
    use_frameworks!
    pod 'STKitSwift'
    
```

## 01.STAlertView

<img src="Resources/STAlertView01.png" width="50%" height="50%"><img src="Resources/STAlertView02.png" width="50%" height="50%">

### Installing

```ruby
pod 'STKitSwift/STAlertView'
```

### Example

```swift
let title = "Flutter 与 iOS 原生 WebView 对比"
STAlertView.show(title: title, message: nil, cancelTitle: "取消", otherTitle: "确定") { (item) in
    print(item)
}
```

## 02.STGradientButton

<img src="Resources/STGradientButton01.png" width="50%" height="50%">

### Installing and Usage

```
pod 'STKitSwift/STGradientButton'
```

## 03.STGradientView

<img src="Resources/STGradientView01.png" width="50%" height="50%">

### Installing and Usage

```
pod 'STKitSwift/STGradientView'
```

## 04.STHUD

<img src="Resources/STHUD01.png" width="50%" height="50%"><img src="Resources/STHUD02.png" width="50%" height="50%">

### Installing and Usage

```
pod 'STKitSwift/STHUD'
```

## 05.STMoveButton
<img src="Resources/STMoveButton.gif" width="50%" height="50%">
### Installing and Usage

```
pod 'STKitSwift/STMoveButton'
```

## 06.STPhoneTextField
<img src="Resources/STPhoneTextField01.png" width="50%" height="50%">
### Installing and Usage

```
pod 'STKitSwift/STPhoneTextField'
```

## 07.STProgressView

<img src="Resources/STProgressView01.png" width="50%" height="50%">

### Installing and Usage

```
pod 'STKitSwift/STProgressView'
```

## 08.STSegmentedControl

<img src="Resources/STSegmentedControl01.png" width="50%" height="50%">

### Installing and Usage

```
pod 'STKitSwift/STSegmentedControl'

```
