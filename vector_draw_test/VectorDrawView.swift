//
//  File.swift
//  
//
//  Created by Abhik Pramanik on 6/10/18.
//

import Foundation
import Macaw

class VectorDrawView: MacawView {
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
