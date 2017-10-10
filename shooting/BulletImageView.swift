//
//  bulletImageView.swift
//  shooting
//
//  Created by yusk on 2017/07/15.
//  Copyright © 2017年 yusk. All rights reserved.
//

import Foundation
import UIKit

class BulletImageView: UIImageView {
    var bullet: Bullet
    var moveTimer: Timer!
    
    init(bullet: Bullet){
        self.bullet = bullet
        let bulletImage:UIImage = UIImage(named:bullet.imageName)!
        super.init(image:bulletImage)
        self.frame.size.width = bullet.width
        self.frame.size.height = bullet.height
        moveTimer = Timer.scheduledTimer(timeInterval: 0.02,
                                         target: self,
                                         selector: #selector(self.move),
                                         userInfo: nil,
                                         repeats: true)
    }
    
    func setCenter(){
        self.center.x = bullet.x
        self.center.y = bullet.y
    }
    
    func setCenter(x:CGFloat, y:CGFloat){
        bullet.setCenter(x: x, y: y)
        self.setCenter()
    }
    
    func move(){
        bullet.move()
        self.setCenter()
        if (bullet.y < -30){
            moveTimer.invalidate()
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
