//
//  Stroke.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/18/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

class Stroke : Mark {
 
    var size: Float?
    var color: UIColor?
    var children: NSMutableArray?
    init() {
        self.children = NSMutableArray()
    }
    
    var lastChild: Mark? {
        return children?.lastObject as! Mark?
    }
    
    func addMark(child: Mark) {
        children!.addObject(child)
    }
    
    func removeMark(child: Mark) {
        if children!.containsObject(child) {
            children!.removeObject(child)
        }
    }
    
    func acceptMarkVisitor(visitor: MarkVisitor) {
        (visitor as! MarkRenderer).visitStroke(self)
    }
}
