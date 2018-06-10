//
//  File.swift
//  vector_draw_test
//
//  Created by Abhik Pramanik on 6/10/18.
//  Copyright © 2018 Abhik Pramanik. All rights reserved.
//

import Macaw

class CanvasView: MacawView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Do nothing for now
        let group = Group()
        super.init(node: group, coder: aDecoder)
    }
}
