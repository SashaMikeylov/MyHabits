//
//  ButtonExtension.swift
//  MyHabits
//
//  Created by Денис Кузьминов on 08.01.2024.
//

import UIKit

extension UIButton {
    
    func buttonAnimation() {
        
        addTarget(self, action: #selector(holdOn), for: [
            .touchDown,
            .touchDragOutside
        ])
        
        addTarget(self, action: #selector(holdOff), for: [
            .touchUpInside,
            .touchCancel,
            .touchDragExit,
            .touchDragOutside,
            .touchUpOutside
        ])
    }
    
    @objc private func holdOn() {
        UIView.animate(withDuration: 0.1, animations: { self.alpha = 0.6})
    }
    
    @objc private func holdOff() {
        UIView.animate(withDuration: 0.1, animations: { self.alpha = 1 })
    }
    
}
