//
//  DefaultStyle.swift
//  ShadowAppleMusic
//
//  Created by 문효재 on 2020/10/25.
//

import UIKit

public enum DefaultStyle{
    public enum Colors {
        public static let tint: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor { traitCollection in
                    if traitCollection.userInterfaceStyle == .dark {
                        return .white
                    } else {
                        return .black
                    }
                }
            } else {
                return .black
            }
        }()
    }
}
