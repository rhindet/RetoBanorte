//
//  Quick_Actions_DemoApp.swift
//  Quick Actions Demo
//
//  Created by Hasan Ali Şişeci on 26.11.2023.
//

import SwiftUI

@main
struct Quick_Actions_DemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var phase

    var body: some Scene {
        WindowGroup {
            NavigationView {
                QuickActionsView()
            }
        }.onChange(of: phase) { oldPhase, newPhase in
            switch phase {
            case .background:
                addQuickActions()
            case .inactive:
                break
            case .active:
                break
            @unknown default:
                break
            }
        }
    }

    func addQuickActions() {
        let homeShortcut = UIApplicationShortcutItem(type: "Transferir", localizedTitle: "Transferir", localizedSubtitle: "Hacer una transferencia", icon: UIApplicationShortcutIcon(type: .home))
        let dimoShortcut = UIApplicationShortcutItem(type: "Dimo", localizedTitle: "Dimo", localizedSubtitle: "Usar Dimo", icon: UIApplicationShortcutIcon(type: .compose))
        let codiShortcut = UIApplicationShortcutItem(type: "CoDi", localizedTitle: "CoDi", localizedSubtitle: "Usar CoDi", icon: UIApplicationShortcutIcon(type: .compose))
        let RSTShortcut = UIApplicationShortcutItem(type: "RST", localizedTitle: "RST", localizedSubtitle: "Usar RST", icon: UIApplicationShortcutIcon(type: .compose))
        let TDShortcut = UIApplicationShortcutItem(type: "TDS", localizedTitle: "TDS", localizedSubtitle: "Usar Targeta Digital", icon: UIApplicationShortcutIcon(type: .compose))

        UIApplication.shared.shortcutItems = [homeShortcut, dimoShortcut,codiShortcut,RSTShortcut,TDShortcut]
    }

}
