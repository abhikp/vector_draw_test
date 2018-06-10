//
//  File.swift
//  
//
//  Created by Abhik Pramanik on 6/10/18.
//

import UIKit
import PureLayout

class VectorDrawView: UIView {
    var canvasView: CanvasView!
    let screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        canvasView = CanvasView(frame: CGRect.zero)
        canvasView.autoSetDimension(.height, toSize: screenSize.height)
        canvasView.autoSetDimension(.width, toSize: screenSize.width)
        
        self.addSubview(canvasView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Do nothing for now
        super.init(coder: aDecoder)
    }
}
