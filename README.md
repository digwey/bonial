Bonial iOS development task
============
![Language](https://img.shields.io/badge/language-Swift%202-orange.svg)
![License](https://img.shields.io/badge/Bonial-First%20Task-green.svg)


[TOC]

# Required Task 
1) FETCH LIST WITH BROCHURES
> - https://dl.dropboxusercontent.com/u/41357788/coding_task/api.json
> - Check the response JSON in a web browser
> - The response will deliver a ‘sectors’ list with sector objects
> - Parse that list and store values in your own Objective-C/Swift model representation.

2) DISPLAY BROCHURES LIST IN A UICOLLECTIONVIEW
> - Every sector object contains a list of “brochures”
> - Present each sector in one collection view section. Collection view cells should
> - Present the associated brochures.
> - The collection view sections should be alphabetically ordered by “sector->name”

3) CREATE A CUSTOM VIEW FOR SECTION HEADER, WHICH DISPLAYS
> - Sector image (you find the url in sector -> url) 
> - Sector name
> - Number of brochures, contained in section

4) CREATE A CUSTOM CELL VIEW FOR COLLECTION VIEW CELLS, WHICH DISPLAYS:
> - Preview image (coverUrl) 
> - RetailerName
> - Title

5) WRITE UNIT TESTS
> - Cover at least one class with unit tests
> - We would like to see that you are familiar with writing unit tests

**Note:**
> -  Do not use any third party libraries
> -  Focus rather on code quality and clean architecture than UI and animations • make sure that you follow the Clean Architecture
> -  Divides an app’s logical structure into distinct layers of responsibility • isolate dependencies
> -  Easy to test
> -  Conforms to the Single Responsibility Principle

#Features
* Swift Programming Language - fully upgraded to version 2
* Custom UIView
![Custom UIView]
(https://raw.githubusercontent.com/digwey/bonial/master/CodingChallenge/screenshots/SectorItemCustomView.png)

* `@IBDesignable` and `@IBInspectable` - Reusable UI components
![Custom UIView]
(https://raw.githubusercontent.com/digwey/bonial/master/CodingChallenge/screenshots/MainViewController.png)

* Layout of complex uicollection view in uitableview using both custom cell [UICustomUITableViewCell, UICustomUICollectionViewCell] 

![Layout Design](https://raw.githubusercontent.com/digwey/bonial/master/CodingChallenge/screenshots/layout.png)


![Layout Design](https://raw.githubusercontent.com/digwey/bonial/master/CodingChallenge/screenshots/StructViewController.png)

* Protocol-Oriented Programming - Still learning though and finding the best practise of that.

# How to build

1) Clone the repository
```bash
$ git clone https://github.com/digwey/bonial.git
```

2) Install pods

```bash
$ cd CodingChallenge
$ pod install
```

3) Open the workspace in Xcode

```bash
$ open "CodingChallenge.xcworkspace"
```
4) Compile and run the app in your simulator or your iOS device

5) If you don't see any data, please check internet connection as the application doesn't check the connectivity status.


Bonier task is an iOS app developed in Swift 2. The app has been actively upgrading to adopt the latest features of iOS and Swift language.

# Notices
The current version is working with Xcode Version 7.3. If you are using different Xcode version, please check out the previous versions. 

# Screenshots
![Screenshot1]
(https://raw.githubusercontent.com/digwey/bonial/master/CodingChallenge/screenshots/BonialScreenShot1.png)
![Screenshot2]
(https://raw.githubusercontent.com/digwey/bonial/master/CodingChallenge/screenshots/BonialScreenShot2.png)

**Gif file using Xcode Emulator**
![Gif1]
(https://raw.githubusercontent.com/digwey/bonial/master/CodingChallenge/screenshots/Viewing.gif)

# Unit testing
* Using XCTest
```bash
func testInitSectorModel(){
//Generating Nil Sector model
let sectorModel = SectorModel(id: -1, name: "TestedModel", url: "MYURL")

//It should be success because Sector Model with negative ID generate nil Model
XCTAssertNil(sectorModel)

//Successfully generated Sector model
let sectorModelSuccessed = SectorModel(id: 1, name: "TestedModel 1", url: "MYURL")

//Test to insure mapping between model consturctor and model properties
XCTAssertEqual(sectorModelSuccessed!.id,1)
XCTAssertEqual(sectorModelSuccessed!.name,"TestedModel 1")
XCTAssertEqual(sectorModelSuccessed!.url,"MYURL")

}
```

# Requirements

* Xcode 7
* iOS 9

#UML
This is consider a very simple UML that consider only one view controller in iOS
You can also render sequence diagrams like this:

>- Sequence diagrams using http://bramp.github.io
```sequence
Title: Bonial Simple Sequence diagrams
iOS Application->Webserver: Send HTTP Get request
Note right of iOS Application: Parse and display Sectors and Brouchors
Webserver->iOS Application: Response JSON response 
```
