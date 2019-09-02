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
                .strokeWidth: -1.5,
                .foregroundColor: UIColor.white,
                .strokeColor: UIColor.black,
                .font: font
            ]
        )

        let strokeLabel = UILabel(frame: CGRect.zero)
        strokeLabel.attributedText = attributedString
        return strokeLabel
    }

    func updateUIView(_ uiView: UILabel, context: Context) {}
}
