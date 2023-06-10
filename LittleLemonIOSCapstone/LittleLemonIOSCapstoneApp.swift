//
//  LittleLemonIOSCapstoneApp.swift
//  LittleLemonIOSCapstone
//
//  Created by XIE CHEN on 2023/06/09.
//

import SwiftUI

@main
struct LittleLemonIOSCapstoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
