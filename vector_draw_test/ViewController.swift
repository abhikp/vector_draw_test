//
//  ViewController.swift
//  vector_draw_test
//
//  Created by Abhik Pramanik on 6/10/18.
//  Copyright © 2018 Abhik Pramanik. All rights reserved.
//

import UIKit
import Macaw

class ViewController: UIViewController {
    var lastPoint = CGPoint.zero
    var swiped = false
    var group = Group()
    var lastShape: Shape?

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
            lastPoint = touch.location(in: self.view)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first as UITouch? {
            let currentPoint = touch.location(in: view)
            drawLine(currentPoint)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first as UITouch? {
            let currentPoint = touch.location(in: view)
            drawLine(currentPoint)
            lastShape = nil
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let macawView = view as? MacawView {
            group = loadScene()
            macawView.node = group
        }
    }
    
    private func loadScene() -> Group {
        let group = Group()
        return group
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

