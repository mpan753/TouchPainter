//
//  MarkVisitor.swift
//  TouchPainter
//
//  Created by Mia on 4/3/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

protocol MarkVisitor {
    
    func visitMark(mark: Mark)
    func visitDot(dot: Dot)
    func visitVertex(vertex: Vertex)
    func visitStroke(stroke: Stroke)
    
}