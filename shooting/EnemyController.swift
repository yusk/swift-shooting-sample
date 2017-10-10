//
//  enemyController.swift
//  shooting
//
//  Created by yusk on 2017/07/16.
//  Copyright © 2017年 yusk. All rights reserved.
//

import Foundation
import UIKit

class EnemyController {
    var view: UIView
    var width: CGFloat
    var height: CGFloat
    var imageName: String
    
    init(view: UIView, width: CGFloat = 50, height: CGFloat = 50, imageName: String = "enemy_1_1.png") {
        self.view = view
        self.width = width
        self.height = height
        self.imageName = imageName
    }
    
    func makeEnemy() -> Enemy {
        return Enemy(imageName:imageName, width:width, height:height)
    }
    
    func generateEnemy(x:CGFloat, y:CGFloat) {
        let enemy = self.makeEnemy()
        let enemyImageView = EnemyImageView(enemy:enemy)
        enemyImageView.setCenter(x: x, y: y)
        self.view.addSubview(enemyImageView)
    }
}
