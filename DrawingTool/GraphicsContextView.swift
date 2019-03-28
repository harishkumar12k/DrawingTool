//
//  GraphicsContextView.swift
//  DrawingTool
//
//  Created by Harish Kumar on 28/03/19.
//  Copyright © 2019 Harish Kumar. All rights reserved.
//

import UIKit

class GraphicsContextView: UIView {
    
    var Lines = [IndividualLine]()
    var LineColor = UIColor.black.cgColor
    var LineWidth : CGFloat = 1

    //MARK - Draw the View
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        context?.setLineCap(.round)
        for LineSet in Lines {
            context?.setStrokeColor(LineSet.LineColor)
            context?.setLineWidth(LineSet.LineWidth)
            for (index, point) in LineSet.Line.enumerated(){
                if index == 0 {
                    context?.move(to: point)
                } else {
                    context?.addLine(to: point)
                }
            }
            context?.strokePath()
        }
    }
    
    //Initialize the empty Line
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Lines.append(IndividualLine(LineWidth: LineWidth, LineColor: LineColor, Line: [CGPoint]()) )
    }
    
    //Get points of draw
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else {return}
        guard var PreviousLine = Lines.popLast() else {return}
        PreviousLine.Line.append(point)
        Lines.append(PreviousLine)
        setNeedsDisplay()
    }
    
    //Remove last Line
    func undoDrawing() {
        if Lines.count > 0{
            _ = Lines.popLast()
            setNeedsDisplay()
        }
    }
    
    //Clear all Lines
    func clearDrawing() {
        if Lines.count > 0{
            Lines.removeAll()
            setNeedsDisplay()
        }
    }
    
    func changeColor(color: UIColor) {
        self.LineColor = color.cgColor
    }
    
    
    func changeSize(widthSize: CGFloat) {
        self.LineWidth = widthSize
    }
    
}
