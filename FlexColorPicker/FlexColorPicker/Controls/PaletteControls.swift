//
//  PaletteControls.swift
//  FlexColorPicker
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

public class RadialPaletteControl: ColorPaletteControl {
    public override func commonInit() {
        colorPalete = RadialHSBPalette()
        super.commonInit()
    }
}

public class RectangularPaletteControl: ColorPaletteControl {
    public override func commonInit() {
        colorPalete = RectangularHSBPalette()
        setDefaultBorder(on: borderOn, forView: contentView)
        setHue(horizontalAxis: hueHorizontal, updateImage: false)
        super.commonInit()
    }

    @IBInspectable
    public var hueHorizontal: Bool = true {
        didSet {
            if oldValue != hueHorizontal {
                setHue(horizontalAxis: hueHorizontal, updateImage: true)
            }
        }
    }

    @IBInspectable
    open var borderOn: Bool = true {
        didSet {
            setDefaultBorder(on: borderOn, forView: contentView)
        }
    }

    open func setHue(horizontalAxis: Bool, updateImage: Bool) {
        hueHorizontal = horizontalAxis
        (colorPalete as? RectangularHSBPalette)?.hueHorizontal = horizontalAxis
        if updateImage {
            updatePaleteImagesAndThumb(isInteractive: false)
        }
    }
}
