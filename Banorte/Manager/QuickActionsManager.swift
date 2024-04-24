//
//  QuickActionsManager.swift
//  Quick Actions Demo
//
//  Created by Hasan Ali Şişeci on 27.11.2023.
//

import SwiftUI

class QuickActionsManager: ObservableObject {
    static let instance = QuickActionsManager()
    @Published var quickAction: QuickAction? = nil

    func handleQaItem(_ item: UIApplicationShortcutItem) {
        print(item)
        if item.type == "Transferir" {
            quickAction = .transferir
        } else if item.type == "Dimo" {
            quickAction = .Dimo
        }else if item.type == "CoDi" {
            quickAction = .CoDi
        }else if item.type == "RST" {
            quickAction = .RST
        }else if item.type == "TDS" {
            quickAction = .TDS
        }

    }
}

enum QuickAction: Hashable {
    case transferir
    case Dimo
    case CoDi
    case RST
    case TDS
}
