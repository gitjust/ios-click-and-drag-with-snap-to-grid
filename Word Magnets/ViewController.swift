//
//  ViewController.swift
//  Word Magnets
//
//  Created by Justinus Andjarwirawan on 7/23/15.
//  Copyright (c) 2015 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myArray = ["facebook", "android", "blogger", "twitter"]
        
        let screenSize = UIScreen.mainScreen().bounds

        for image in myArray {
            let theImage = UIImage(named: image)
            let imageView = UIImageView(image: theImage)
            let xI = CGFloat(arc4random_uniform(UInt32(screenSize.width)))
            let yI = CGFloat(arc4random_uniform(UInt32(screenSize.height)))
            imageView.frame = CGRect(x: xI, y: yI, width: 40, height: 40)
            self.view.addSubview(imageView)
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
            imageView.addGestureRecognizer(panGesture)
            imageView.userInteractionEnabled = true
        }

    }
    
    func handlePanGesture(panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translationInView(view)
        panGesture.setTranslation(CGPointZero, inView: view)
        let gambar = panGesture.view as! UIImageView
        gambar.center = CGPoint(x: gambar.center.x+translation.x, y: gambar.center.y+translation.y)
        switch panGesture.state {
        case .Ended:
            let diffPosX = Int(gambar.center.x+translation.x)%50
            let diffPosY = Int(gambar.center.y+translation.y)%50
//            print("diffX: \(diffPosX), diffY: \(diffPosY)")
            var geserX = 0
            var geserY = 0
            if diffPosX < 26 {
                geserX = Int(gambar.center.x) - diffPosX
            } else {
                geserX = Int(gambar.center.x) + (50-diffPosX)
            }
            if diffPosY < 26 {
                geserY = Int(gambar.center.y) - diffPosY
            } else {
                geserY = Int(gambar.center.y) + (50-diffPosY)
            }
            gambar.center = CGPoint(x: geserX, y: geserY)
            print("X: \(gambar.center.x) Y: \(gambar.center.y)")
        default:
            print()
        }
        self.view.addSubview(gambar)
    }

    // sembunyikan status bar (sinyal operator, baterai, jam, dll.)
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

