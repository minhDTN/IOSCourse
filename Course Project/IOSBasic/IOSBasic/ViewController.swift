//
//  ViewController.swift
//  IOSBasic
//
//  Created by minhdtn on 07/09/2022.
//
import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var viewForLayer: UIView!

    var layer: CALayer {
        return viewForLayer.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
    }

    func setUpLayer() {
        view.backgroundColor = .purple
        layer.backgroundColor = UIColor.blue.cgColor
        layer.borderWidth = 100.0
        layer.borderColor = UIColor.red.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10.0
        layer.contents = UIImage(named: "TaylorSwift")?.cgImage
        layer.contentsGravity = CALayerContentsGravity.center
    }
    
}

