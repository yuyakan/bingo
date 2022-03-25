//
//  DeviceTraitStatus.swift
//  bingo
//
//  Created by 上別縄祐也 on 2022/03/22.
//

import SwiftUI

enum DeviceTraitStatus {
    case wRhR
    case wChR
    case wRhC
    case wChC

    init(hSizeClass: UserInterfaceSizeClass?, vSizeClass: UserInterfaceSizeClass?) {

        switch (hSizeClass, vSizeClass) {
        case (.regular, .regular):
            self = .wRhR
        case (.compact, .regular):
            self = .wChR
        case (.regular, .compact):
            self = .wRhC
        case (.compact, .compact):
            self = .wChC
        default:
            self = .wChR
        }
    }
}
