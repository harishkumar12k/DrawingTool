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
    let DrawingView = GraphicsContextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DrawingView.frame = SampleGraphicView.bounds
        DrawingView.backgroundColor = .white
        SampleGraphicView.addSubview(DrawingView)
    }
    
}

