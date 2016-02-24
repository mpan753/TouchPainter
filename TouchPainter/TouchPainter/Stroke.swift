//
//  Stroke.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/18/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

class Stroke: Mark {

    var size:Float
    var children:[Mark]?
    init() {
        children = []
    }
    
    func addMark(child: Mark) {
        children!.append(child)
    }
    
    func removeMark(child: Mark) {
        if (children! as NSMutableArray).containsObject(child) {
            
        }
    }
}
