//
//  EnemyImageView.swift
//  shooting
//
//  Created by yusk on 2017/07/16.
//  Copyright © 2017年 yusk. All rights reserved.
//

import Foundation
import UIKit

class EnemyImageView: UIImageView {
    var enemy: Enemy
    var moveTimer: Timer!
    
    init(enemy: Enemy){
        self.enemy = enemy
        let enemyImage:UIImage = UIImage(named:enemy.imageName)!
        super.init(image:enemyImage)
        self.frame.size.width = enemy.width
        self.frame.size.height = enemy.height
        moveTimer = Timer.scheduledTimer(timeInterval: 0.02,
                                         target: self,
                                         selector: #selector(self.move),
                                         userInfo: nil,
                                         repeats: true)
    }
    
    func setCenter(){
        self.center.x = enemy.x
        self.center.y = enemy.y
    }
    
    func setCenter(x:CGFloat, y:CGFloat){
        enemy.setCenter(x: x, y: y)
        self.setCenter()
    }
    
    func move(){
        enemy.move()
        self.setCenter()
        if (enemy.y > UIScreen.main.bounds.size.height + 20){
            print("enemyDelete")
            moveTimer.invalidate()
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
