//
//  MarkRenderer.swift
//  TouchPainter
//
//  Created by Mia on 4/3/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

class MarkRenderer: NSObject, MarkVisitor {
    var context: CGContextRef
    var shouldMoveContextToDot : Bool
    
    init(context: CGContextRef) {
        self.context = context
        self.shouldMoveContextToDot = true
    }
    
    func visitMark(mark: Mark) {
        
    }
    
    func visitDot(dot: Dot) {
        CGContextMoveToPoint(context, dot.location!.x, dot.location!.y)
        CGContextSetFillColorWithColor(context, dot.color!.CGColor)
        CGContextFillEllipseInRect(context, CGRect(origin: dot.location!, size: CGSize(width:CGFloat(dot.size!), height:CGFloat(dot.size!))))
    }
    
    func visitVertex(vertex: Vertex) {
        if shouldMoveContextToDot {
            CGContextMoveToPoint(context, vertex.location!.x, vertex.location!.y)
            shouldMoveContextToDot = false
        } else {
            CGContextAddLineToPoint(context, vertex.location!.x, vertex.location!.y)
        }
    }
    
    func visitStroke(stroke: Stroke) {
        CGContextSetStrokeColorWithColor(context, stroke.color?.CGColor)
        CGContextSetLineWidth(context, CGFloat(stroke.size!))
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextStrokePath(context)
        shouldMoveContextToDot = true
    }
    
}
