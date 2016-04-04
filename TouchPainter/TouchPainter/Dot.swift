//
//  Dot.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/18/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

class Dot: Vertex {
    var color: UIColor?
    var size: Float?
    
    init(color:UIColor, size:Float) {
        self.color = color
        self.size = size
        super.init()
    }
    
    override func acceptMarkVisitor(visitor: MarkVisitor) {
        (visitor as! MarkRenderer).visitDot(self)
    }
}
