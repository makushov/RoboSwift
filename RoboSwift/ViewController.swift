//
//  ViewController.swift
//  RoboSwift
//
//  Created by Stanislav Makushov on 08.10.2021.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var anchor: RoboMan.Сцена!
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        anchor = try! RoboMan.loadСцена()
        anchor.generateCollisionShapes(recursive: true)
        
        arView.scene.anchors.append(anchor)
        
        arView.addSubview(button)
        button.frame = CGRect(x: 16, y: 50, width: UIScreen.main.bounds.size.width - 32, height: 30)
        button.setTitle("Start expirience", for: .normal)
        button.addTarget(self, action: #selector(observeTap), for: .touchUpInside)
    }
    
    @objc func observeTap() {
        anchor.notifications.roboStart.post()
    }
}
