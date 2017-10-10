//
//  BulletController.swift
//  shooting
//
//  Created by yusk on 2017/07/15.
//  Copyright © 2017年 yusk. All rights reserved.
//

import Foundation
import UIKit

class BulletController {
    var view: UIView
    var width: CGFloat
    var height: CGFloat
    var imageName: String
    
    init(view: UIView, width: CGFloat = 20, height: CGFloat = 40, imageName: String = "bullet_1_1.png") {
        self.view = view
        self.width = width
        self.height = height
        self.imageName = imageName
    }
    
    func makeBullet() -> Bullet {
        return Bullet(imageName:imageName, width:width, height:height)
    }
    
    func generateBullet(x:CGFloat, y:CGFloat) {
        let bullet = self.makeBullet()
        let bulletImageView = BulletImageView(bullet:bullet)
        bulletImageView.setCenter(x: x, y: y)
        self.view.addSubview(bulletImageView)
    }
}
