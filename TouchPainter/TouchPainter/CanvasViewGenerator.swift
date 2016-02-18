//
//  CanvasViewGenerator.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/18/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

class CanvasViewGenerator: NSObject {
    func canvasViewWithFrame(aFrame:CGRect) -> CanvasView {
        return CanvasView(frame: aFrame)
    }
}
