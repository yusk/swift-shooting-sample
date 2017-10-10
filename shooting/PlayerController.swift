//
//  PlayerController.swift
//  shooting
//
//  Created by yusk on 2017/07/15.
//  Copyright © 2017年 yusk. All rights reserved.
//

import Foundation
import UIKit

class PlayerController {
    var view: UIView
    var playerImageView: UIImageView
    var bulletController: BulletController
    var shotTimer: Timer!
    
    init(view: UIView, playerImageView: UIImageView, width: Int = 50, height: Int = 50) {
        self.view = view
        self.playerImageView = playerImageView
        self.playerImageView.frame.size.width = 50
        self.playerImageView.frame.size.height = 50
        bulletController = BulletController(view: self.view)
        shotTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                         target: self,
                                         selector: #selector(self.autoShot),
                                         userInfo: nil,
                                         repeats: true)
    }
    
    func set_point(x:CGFloat, y:CGFloat){
        playerImageView.frame.origin.x = x
        playerImageView.frame.origin.y = y
    }
    
    func get_point() -> (CGFloat, CGFloat){
        return (playerImageView.frame.origin.x, playerImageView.frame.origin.y)
    }
    
    @objc func autoShot() {
        print("autoShot")
        bulletController.generateBullet(x: playerImageView.center.x, y: playerImageView.center.y - playerImageView.frame.height/2)
    }
    
}
