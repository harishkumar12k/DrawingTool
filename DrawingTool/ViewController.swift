//
//  ViewController.swift
//  DrawingTool
//
//  Created by Harish Kumar on 28/03/19.
//  Copyright © 2019 Harish Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var SampleGraphicView: UIView!
    @IBOutlet var ColorSelectorView: UIView!
    @IBOutlet var SizeSliderView: UIView!
    let DrawingView = GraphicsContextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        AddDrawingView()
        DrawingView.changeSize(widthSize: CGFloat(1))
    }
    
    func AddDrawingView() {
        DrawingView.frame = SampleGraphicView.bounds
        DrawingView.backgroundColor = .white
        SampleGraphicView.addSubview(DrawingView)
    }
    
    @IBAction func undoAction(_ sender: UIButton) {
        DrawingView.undoDrawing()
    }
    
    @IBAction func clearAction(_ sender: Any) {
        DrawingView.clearDrawing()
    }
    
    @IBAction func hideOrShowColorSelector(_ sender: Any) {
        ColorSelectorView.isHidden = !(ColorSelectorView.isHidden)
    }
    
    @IBAction func selectRedColor(_ sender: UIButton) {
        DrawingView.changeColor(color: sender.backgroundColor ?? UIColor.black)
    }
    
    @IBAction func selectGreen(_ sender: UIButton) {
        DrawingView.changeColor(color: sender.backgroundColor ?? UIColor.black)
    }
    
    @IBAction func selectBlue(_ sender: UIButton) {
        DrawingView.changeColor(color: sender.backgroundColor ?? UIColor.black)
    }
    
    @IBAction func hideOrShowSizeSlider(_ sender: Any) {
        SizeSliderView.isHidden = !(SizeSliderView.isHidden)
    }
    @IBAction func sizeSlider(_ sender: UISlider) {
        DrawingView.changeSize(widthSize: CGFloat(sender.value))
    }
    
}

