//
//  ViewController.swift
//  shooting
//
//  Created by yusk on 2017/07/02.
//  Copyright © 2017年 yusk. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var player:UIImageView!
    @IBOutlet weak var restartButton:UIButton!
    @IBOutlet weak var gameoverLabel:UILabel!
    
    var playerController: PlayerController!
    var enemyController: EnemyController!
    var enemyTimer: Timer!
    var collisionTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerController = PlayerController(view: self.view, playerImageView: player)
        enemyController = EnemyController(view: self.view)
        restartButton.isHidden = true
        gameoverLabel.isHidden = true
        enemyTimer = Timer.scheduledTimer(timeInterval: 0.2,
                                          target: self,
                                          selector: #selector(self.generateEnemy),
                                          userInfo: nil,
                                          repeats: true)
        collisionTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                              target: self,
                                              selector: #selector(self.collisionDetermination),
                                              userInfo: nil,
                                              repeats: true)

    }
    
    func generateEnemy(){
        print("generateEnemy")
        let x = arc4random() % UInt32(UIScreen.main.bounds.size.width)
        enemyController.generateEnemy(x: CGFloat(x), y: -30)
    }
    
    func collisionDetermination(){
        print("collisionDetermination")
        let bullets = self.view.subviews.filter({(w:AnyObject) -> Bool in String(describing: type(of: w)) == "BulletImageView"})
        let enemys = self.view.subviews.filter({(w:AnyObject) -> Bool in String(describing: type(of: w)) == "EnemyImageView"})
        for bullet in bullets{
            for enemy in enemys{
                if bullet.frame.intersects(enemy.frame) {
                    bullet.removeFromSuperview()
                    enemy.removeFromSuperview()
                }
                if player.frame.intersects(enemy.frame) {
                    player.removeFromSuperview()
                    playerController.shotTimer.invalidate()
                    restartButton.isHidden = false
                    gameoverLabel.isHidden = false
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self.view)
            playerController.set_point(x: location.x - (player?.frame.width)!/2, y: location.y - (player?.frame.height)!/2)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let location = touch.location(in: self.view)
            playerController.set_point(x: location.x - (player?.frame.width)!/2, y: location.y - (player?.frame.height)!/2)
        }
    }

}

