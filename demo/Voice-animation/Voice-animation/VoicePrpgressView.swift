//
//  VoicePrpgressView.swift
//  Animation-voice
//
//  Created by wsj on 2019/10/19.
//  Copyright © 2019 wsj. All rights reserved.
//

import UIKit

class VoicePrpgressView: UIView {
    
    enum BarEdge {
        case square, round
    }
    
    enum BarGravity {
        case center, bottom, top
    }
    
    var barCount: Int = 0
    var barWidth: CGFloat = 2.0
    var spacing: CGFloat = 1.0
    var barHightColor: UIColor = UIColor(hex: "#855EEF")
    var barNormalColor: UIColor = UIColor(hex: "#D8D8D8")
    var hasAnimation: Bool = true
    var barsHeight: [CGFloat] = []
    var barGravity: BarGravity = .bottom
    var barEdgeStyle: BarEdge = .square
    var progress: CGFloat = 0.0 {
        didSet(oldValue) {
            if oldValue != self.progress {
                setNeedsDisplay()
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        guard barsHeight.count == barCount else {
            return
        }
        let height = rect.height
        for i in 0..<barCount {
            var barRatio = barsHeight[i]
            if hasAnimation {
                barRatio = max(0, barsHeight[i] + CGFloat.random(in: -0.1..<0.1))
            }
            let barHeight = barRatio * height
            var barY = height - barHeight
            if barGravity == .top {
                barY = 0
            } else if barGravity == .center {
                barY = barY / 2
            }
            let path = UIBezierPath(rect: CGRect(x: CGFloat(i) * (barWidth + spacing) + 2,
                                                 y: barY,
                                                 width: 0,
                                                 height: barHeight))
            path.lineWidth = barWidth
            if barEdgeStyle == .round {
                path.lineCapStyle = .round
                path.lineCapStyle = .round
            }
            if CGFloat(i) / CGFloat(barCount) < progress {
                barHightColor.set()
            } else {
                barNormalColor.set()
            }
            path.stroke()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    convenience init(hex: String) {
        var aHex = hex
        if aHex.starts(with: "#") {
            aHex.remove(at: aHex.startIndex)
        }
        let scanner = Scanner(string: aHex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
