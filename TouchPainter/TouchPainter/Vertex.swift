//
//  Vertex.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/18/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

class Vertex: Mark {
    var location: CGPoint?
    init() {
        
    }
    init(location: CGPoint) {
        self.location! = location
    }
    
    var lastChild: Mark? {
        return nil
    }
    
    func addMark(child: Mark) {
        
    }
    
    func removeMark(child: Mark) {
        
    }
    
    func acceptMarkVisitor(visitor: MarkVisitor) {
        
    }
}
