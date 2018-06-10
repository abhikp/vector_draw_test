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
    var buttonView: UIButton!
    let screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black

        // Create canvas
        canvasView = CanvasView(frame: CGRect.zero)
        self.addSubview(canvasView)

        canvasView.autoSetDimension(.height, toSize: screenSize.height)
        canvasView.autoSetDimension(.width, toSize: screenSize.width)

        // Create controls
        let controlsView = UIView(frame: CGRect.zero)
        self.addSubview(controlsView)
        
        controlsView.backgroundColor = .gray
        controlsView.autoSetDimension(.height, toSize: 200)
        controlsView.autoSetDimension(.width, toSize: 50)
        controlsView.autoPinEdge(.right, to: .right, of: self)
        controlsView.autoAlignAxis(.horizontal, toSameAxisOf: self)
        controlsView.layer.cornerRadius = 8.0
        controlsView.clipsToBounds = true
        controlsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        buttonView = UIButton(frame: CGRect.zero)
        controlsView.addSubview(buttonView)

        buttonView.backgroundColor = .black
        buttonView.autoPinEdge(.top, to: .top, of: controlsView, withOffset: 8.0)
        buttonView.autoPinEdge(.left, to: .left, of: controlsView, withOffset: 8.0)
        buttonView.autoPinEdge(.right, to: .right, of: controlsView, withOffset: -8.0)
        buttonView.autoMatch(.height, to: .width, of: buttonView)
        buttonView.layer.cornerRadius = 8.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Do nothing for now
        super.init(coder: aDecoder)
    }
}
