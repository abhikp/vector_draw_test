//
//  ViewController.swift
//  vector_draw_test
//
//  Created by Abhik Pramanik on 6/10/18.
//  Copyright © 2018 Abhik Pramanik. All rights reserved.
//

import UIKit
import Macaw

class VectorDrawController: UIViewController {
    var lastPoint = CGPoint.zero
    var swiped = false
    var group = Group()
    var lastShape: Shape?
    var canvasView: CanvasView? {
        if let vectorDrawView = view as? VectorDrawView {
            print("here")
            return vectorDrawView.canvasView
        }
        
        print("here")
        return nil
    }
    
    func drawLine(_ currentPoint: CGPoint) {
        print("LastPoint: \(lastPoint), currentPoint: \(currentPoint)")
        let line = Line(
            x1: Double(lastPoint.x),
            y1: Double(lastPoint.y),
            x2: Double(currentPoint.x),
            y2: Double(currentPoint.y)
        )
       
        if lastShape == nil {
            lastShape = Shape(form: line, stroke: Stroke(fill: Color(val: 0xff9e4f), width: 2))
            group.contents.append(lastShape!)
        } else {
            lastShape?.form = line
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first as UITouch? {
            lastPoint = touch.location(in: canvasView)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first as UITouch? {
            let currentPoint = touch.location(in: canvasView)
            drawLine(currentPoint)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first as UITouch? {
            let currentPoint = touch.location(in: canvasView)
            drawLine(currentPoint)
            lastShape = nil
        }
    }

    override func loadView() {
        self.view = VectorDrawView(frame: CGRect.zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if let vectorDrawView = view as? VectorDrawView {
            group = loadScene()
            vectorDrawView.canvasView.node = group
        
            vectorDrawView.buttonView.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        if let vectorDrawView = view as? VectorDrawView {
            print("rotating canvas view")
            canvasView!.transform = canvasView!.transform.rotated(by: CGFloat(45 * Double.pi / 180))
        }
    }
    
    private func loadScene() -> Group {
        let group = Group()
        return group
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
        } else {
            print("Portrait")
        }
    }
}

