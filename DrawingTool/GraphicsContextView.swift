//
//  GraphicsContextView.swift
//  DrawingTool
//
//  Created by Harish Kumar on 28/03/19.
//  Copyright © 2019 Harish Kumar. All rights reserved.
//

import UIKit

class GraphicsContextView: UIView {
    
    var Lines = [[CGPoint]]()
    
    //MARK - Draw the View
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.setLineWidth(5)
        context?.setLineCap(.round)
        for Line in Lines {
            for (x, y) in Line.enumerated(){
                if x == 0 {
                    context?.move(to: y)
                } else {
                    context?.addLine(to: y)
                }
            }
        }
        context?.strokePath()
    }
    
    //Initialize the empty Line
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Lines.append([CGPoint]())
    }
    
    //Get points of draw
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else {return}
        guard var PreviousLine = Lines.popLast() else {return}
        PreviousLine.append(point)
        Lines.append(PreviousLine)
        setNeedsDisplay()
    }
    
}
