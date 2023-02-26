//
//  Shape+Polygon.swift
//  CryptedTruth
//
//  Created by Anna Alicia Milani on 25/02/23.
//

import Foundation
import SwiftUI

struct Pentagon: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2
        let angle = CGFloat.pi * 2 / 5
        let startAngle = -CGFloat.pi / 2
        path.move(to: CGPoint(x: center.x + radius * cos(startAngle), y: center.y + radius * sin(startAngle)))
        for i in 1...5 {
            let x = center.x + radius * cos(startAngle + angle * CGFloat(i))
            let y = center.y + radius * sin(startAngle + angle * CGFloat(i))
            path.addLine(to: CGPoint(x: x, y: y))
        }
        path.close()
        return Path(path.cgPath)
    }
}
