//
//  StrokeText.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 9/2/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct StrokeText: UIViewRepresentable {
    var text: String
    var font: UIFont
    
    func makeUIView(context: Context) -> UILabel {
        let attributedString = NSAttributedString(
            string: text,
            attributes:[
                NSAttributedString.Key.paragraphStyle: NSMutableParagraphStyle(),
                NSAttributedString.Key.strokeWidth: -3.0,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeColor: UIColor.black,
                NSAttributedString.Key.font: font
            ]
        )

        let strokeLabel = UILabel(frame: CGRect.zero)
        strokeLabel.attributedText = attributedString
        strokeLabel.sizeToFit()
        return strokeLabel
    }

    func updateUIView(_ uiView: UILabel, context: Context) {}
}
