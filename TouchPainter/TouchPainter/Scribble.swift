//
//  Scribble.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/18/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

public let didChangeValueForMarkNotification : String = "didChangeValueForMarkNotification"

class Scribble : NSObject {
    private var parentMark : Mark
    var mark : Mark {
        set {
            parentMark = newValue
        }

        get {
            return parentMark
        }
    }
    
    var array : NSMutableArray = NSMutableArray()
    
    var incrementalMark : Mark?
    override init() {
        parentMark = Stroke()
        super.init()
    
    }
    func addMark(aMark: Mark, shouldAddToPreviousMark: Bool) {
//        self.willChangeValueForKey("mark")
        if shouldAddToPreviousMark {
            mark.lastChild?.addMark(aMark)
        } else {
            mark.addMark(aMark)
        }
//        self.didChangeValueForKey("mark")
        NSNotificationCenter.defaultCenter().postNotificationName(didChangeValueForMarkNotification, object:self, userInfo:["mark" : mark])
    }
    
}
