//
//  Enemy.swift
//  shooting
//
//  Created by yusk on 2017/07/16.
//  Copyright © 2017年 yusk. All rights reserved.
//

import Foundation
import UIKit

class Enemy: NSObject{
    var width: CGFloat
    var height: CGFloat
    var imageName: String
    var ySpeed: CGFloat
    var maxHP: Int
    var x: CGFloat!
    var y: CGFloat!
    
    
    init(imageName: String = "bullet_1_1.png", width: CGFloat = 20, height: CGFloat = 40, ySpeed: CGFloat = 3, maxHP: Int = 10){
        self.width = width
        self.height = height
        self.imageName = imageName
        self.ySpeed = ySpeed
        self.maxHP = maxHP
    }
    
    func setCenter(x:CGFloat, y:CGFloat){
        self.x = x
        self.y = y
    }
    
    func move(){
        y = y + ySpeed
    }
    
}
