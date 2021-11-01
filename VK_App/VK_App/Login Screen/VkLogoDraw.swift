//
//  VkLogoDraw.swift
//  VK_App
//
//  Created by Антон Онищенко on 28.04.2021.
//

import UIKit

class VkLogoDraw: UIView {
    
//    let scale = 0.14
    let vkLogoLayer = CAShapeLayer()
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sutupSubLayers()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        sutupSubLayers()
        
    }
    
    fileprivate func sutupSubLayers() {
        vkLogoLayer.path = vklogoPath.cgPath
        vkLogoLayer.lineWidth = 9
        vkLogoLayer.strokeColor = UIColor.black.cgColor
        vkLogoLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(vkLogoLayer)
    }
}

let scale = 0.14
var vklogoPath: UIBezierPath {
    
    let logoPath = UIBezierPath()
    
    logoPath.move(to: CGPoint(x: 1547.43 * scale, y: 61.18 * scale))
    logoPath.addCurve(to: CGPoint(x: 1495.45 * scale, y: -0.45 * scale), controlPoint1: CGPoint(x: 1558.56 * scale, y: 24.93 * scale), controlPoint2: CGPoint(x: 1547.43 * scale, y: -0.45 * scale))
    logoPath.addLine(to: CGPoint(x: 1322.18 * scale, y: -0.45 * scale))
    logoPath.addCurve(to: CGPoint(x: 1246.68 * scale, y: 47.89 * scale), controlPoint1: CGPoint(x: 1277.62 * scale, y: -0.45 * scale), controlPoint2: CGPoint(x: 1257.82 * scale, y: 22.51 * scale))
    logoPath.addCurve(to: CGPoint(x: 1033.81 * scale, y: 393.5 * scale), controlPoint1: CGPoint(x: 1246.68 * scale, y: 47.89 * scale), controlPoint2: CGPoint(x: 1158.81 * scale, y: 258.16 * scale))
    logoPath.addCurve(to: CGPoint(x: 953.37 * scale, y: 445.46 * scale), controlPoint1: CGPoint(x: 992.97 * scale, y: 433.38 * scale), controlPoint2: CGPoint(x: 975.64 * scale, y: 445.46 * scale) )
    logoPath.addCurve(to: CGPoint(x: 926.14 * scale, y: 397.12 * scale), controlPoint1: CGPoint(x: 942.23 * scale, y: 445.46 * scale), controlPoint2: CGPoint(x: 926.14 * scale, y: 433.38 * scale))
    logoPath.addLine(to: CGPoint(x: 926.14 * scale, y: 61.18 * scale))
    logoPath.addCurve(to: CGPoint(x: 876.63 * scale, y: -0.45 * scale), controlPoint1: CGPoint(x: 926.14 * scale, y: 17.68 * scale), controlPoint2: CGPoint(x: 913.76 * scale, y: -0.45 * scale))
    logoPath.addLine(to: CGPoint(x: 604.36 * scale, y: -0.45 * scale))
    logoPath.addCurve(to: CGPoint(x: 559.8 * scale, y: 38.22 * scale), controlPoint1: CGPoint(x: 577.13 * scale, y: -0.45 * scale), controlPoint2: CGPoint(x: 559.8 * scale, y: 20.1 * scale) )
    logoPath.addCurve(to: CGPoint(x: 629.11 * scale, y: 202.57 * scale), controlPoint1: CGPoint(x: 559.8 * scale, y: 79.31 * scale), controlPoint2: CGPoint(x: 621.68 * scale, y: 88.98 * scale))
    logoPath.addLine(to: CGPoint(x: 629.11 * scale, y: 451.5 * scale) )
    logoPath.addCurve(to: CGPoint(x: 596.93 * scale, y: 515.55 * scale), controlPoint1: CGPoint(x: 629.11 * scale, y: 505.88 * scale), controlPoint2: CGPoint(x: 619.21 * scale, y: 515.55 * scale))
    logoPath.addCurve(to: CGPoint(x: 311.04 * scale, y: 63.6 * scale), controlPoint1: CGPoint(x: 538.76 * scale, y: 515.55 * scale), controlPoint2: CGPoint(x: 395.2 * scale, y: 305.28 * scale))
    logoPath.addCurve(to: CGPoint(x: 233.07 * scale, y: -0.45 * scale), controlPoint1: CGPoint(x: 293.71 * scale, y: 18.89 * scale), controlPoint2: CGPoint(x: 277.62 * scale, y: -0.45 * scale))
    logoPath.addLine(to: CGPoint(x: 59.8 * scale, y: -0.45 * scale))
    logoPath.addCurve(to: CGPoint(x: 0.4 * scale, y: 47.89 * scale), controlPoint1: CGPoint(x: 10.3 * scale, y: -0.45 * scale), controlPoint2: CGPoint(x: 0.4 * scale, y: 22.51 * scale))
    logoPath.addCurve(to: CGPoint(x: 273.91 * scale, y: 608.6 * scale), controlPoint1: CGPoint(x: 0.4 * scale, y: 92.6 * scale), controlPoint2: CGPoint(x: 58.56 * scale, y: 314.95 * scale))
    logoPath.addCurve(to: CGPoint(x: 802.38 * scale, y: 917.95 * scale), controlPoint1: CGPoint(x: 417.48 * scale, y: 809.19 * scale), controlPoint2: CGPoint(x: 619.21 * scale, y: 917.95 * scale))
    logoPath.addCurve(to: CGPoint(x: 926.14 * scale, y: 852.7 * scale), controlPoint1: CGPoint(x: 912.52 * scale, y: 917.95 * scale), controlPoint2: CGPoint(x: 926.14 * scale, y: 893.78 * scale))
    logoPath.addLine(to: CGPoint(x: 926.14 * scale, y: 700.44 * scale))
    logoPath.addCurve(to: CGPoint(x: 971.93 * scale, y: 642.43 * scale), controlPoint1: CGPoint(x: 926.14 * scale, y: 652.1 * scale), controlPoint2: CGPoint(x: 936.04 * scale, y: 642.43 * scale))
    logoPath.addCurve(to: CGPoint(x: 1143.96 * scale, y: 751.19 * scale), controlPoint1: CGPoint(x: 997.92 * scale, y: 642.43 * scale), controlPoint2: CGPoint(x: 1041.24 * scale, y: 654.52 * scale))
    logoPath.addCurve(to: CGPoint(x: 1346.93 * scale, y: 917.95 * scale), controlPoint1: CGPoint(x: 1261.53 * scale, y: 865.99 * scale), controlPoint2: CGPoint(x: 1281.34 * scale, y: 917.95 * scale))
    logoPath.addLine(to: CGPoint(x: 1520.2 * scale, y: 917.95 * scale))
    logoPath.addCurve(to: CGPoint(x: 1579.6 * scale, y: 846.65 * scale), controlPoint1: CGPoint(x: 1569.7 * scale, y: 917.95 * scale), controlPoint2: CGPoint(x: 1594.46 * scale, y: 893.78 * scale))
    logoPath.addCurve(to: CGPoint(x: 1433.56 * scale, y: 648.47 * scale), controlPoint1: CGPoint(x: 1563.51 * scale, y: 799.53 * scale), controlPoint2: CGPoint(x: 1507.82 * scale, y: 730.65 * scale))
    logoPath.addCurve(to: CGPoint(x: 1314.75 * scale, y: 526.42 * scale), controlPoint1: CGPoint(x: 1392.72 * scale, y: 601.35 * scale), controlPoint2: CGPoint(x: 1332.08 * scale, y: 551.8 * scale))
    logoPath.addCurve(to: CGPoint(x: 1314.75 * scale, y: 451.5 * scale), controlPoint1: CGPoint(x: 1288.76 * scale, y: 493.8 * scale), controlPoint2: CGPoint(x: 1296.19 * scale, y: 479.3 * scale))
    logoPath.addCurve(to: CGPoint(x: 1547.43 * scale, y: 61.18 * scale), controlPoint1: CGPoint(x: 1314.75 * scale, y: 450.29 * scale), controlPoint2: CGPoint(x: 1526.39 * scale, y: 160.27 * scale))
    
    return logoPath
}
