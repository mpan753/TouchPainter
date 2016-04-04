//
//  Scribble.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/18/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

class Scribble : NSObject {

    var parentMark : Mark
    var mark : Mark
    var incrementalMark : Mark?
    override init() {
        parentMark = Stroke()
        mark = parentMark
        super.init()
    }
    
    func addMark(aMark: Mark, shouldAddToPreviousMark: Bool) {
        self.willChangeValueForKey("mark")
        if shouldAddToPreviousMark {
            parentMark.lastChild?.addMark(aMark)
        } else {
            parentMark.addMark(aMark)
        }
        self.didChangeValueForKey("mark")
    }
    
}
