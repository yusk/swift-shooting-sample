//
//  bullet.swift
//  shooting
//
//  Created by yusk on 2017/07/15.
//  Copyright © 2017年 yusk. All rights reserved.
//

import Foundation
import UIKit

class Bullet: NSObject{
    var width: CGFloat
    var height: CGFloat
    var imageName: String
    var ySpeed: CGFloat
    var x: CGFloat!
    var y: CGFloat!

    
    init(imageName: String = "enemy_1_1.png", width: CGFloat = 20, height: CGFloat = 40, ySpeed: CGFloat = -5){
        self.width = width
        self.height = height
        self.imageName = imageName
        self.ySpeed = ySpeed
    }
    
    func setCenter(x:CGFloat, y:CGFloat){
        self.x = x
        self.y = y
    }
    
    func move(){
        y = y + ySpeed
    }
    
}
