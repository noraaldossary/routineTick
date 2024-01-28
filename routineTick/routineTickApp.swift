//
//  routineTickApp.swift
//  routineTick
//
//  Created by Nora Aldossary on 11/07/1445 AH.
//

import SwiftUI
import SwiftData

@main
struct routineTickApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: NewTask.self )
        }
    }
}
