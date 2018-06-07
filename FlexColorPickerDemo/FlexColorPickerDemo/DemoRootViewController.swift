//
//  DemoRootViewController.swift
//  FlexColorPickerDemo
//
//  Created by Rastislav Mirek on 7/6/18.
//  
//	MIT License
//  Copyright (c) 2018 Rastislav Mirek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit
import FlexColorPicker

var pickedColor: UIColor = .white

class DemoRootViewController: UITableViewController {
    @IBOutlet weak var pickerColorPreview: CircleShapedView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pickerColorPreview.backgroundColor = pickedColor
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationColorPicker = segue.destination as? FlexColorPickerController {
            destinationColorPicker.selectedColor = pickedColor
            destinationColorPicker.delegate = self
        }
    }
}

extension DemoRootViewController: FlexColorPickerDelegate {
    func colorPicker(_: FlexColorPicker, selectedColor: UIColor, usingControl: ColorControl) {
        pickedColor = selectedColor
        pickerColorPreview.backgroundColor = selectedColor
    }

    func colorPicker(_: FlexColorPicker, confirmedColor: UIColor, usingControl: ColorControl) {
        navigationController?.popViewController(animated: true)
    }
}
