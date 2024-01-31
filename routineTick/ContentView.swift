//
//  ContentView.swift
//  routineTick
//
//  Created by Nora Aldossary on 11/07/1445 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RuleView()
                .tabItem {
                    Label("Challenge", systemImage: "checklist")
                }
            
            RuleView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            
            RuleView()
                .tabItem {
                    Label("Stories", systemImage: "book.pages")
                }
        }
        .accentColor(Color("MainColor"))

        
        
    }
}
    #Preview {
        ContentView()
    }

//
//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var roleManager = RoleManager()
//
//    var body: some View {
//        TabView {
//            RuleView()
//                .tabItem {
//                    Label("Challenge", systemImage: "checklist")
//                }
//                .environmentObject(roleManager)
//
//            
//            RuleView()
//                .tabItem {
//                    Label("Calendar", systemImage: "calendar")
//                }
//                .environmentObject(roleManager)
//
//            
//            RuleView()
//                .tabItem {
//                    Label("Stories", systemImage: "book.pages")
//                }
//                .environmentObject(roleManager)
//        }
//        .accentColor(Color("MainColor"))
//        
//    }
//}
//    #Preview {
//        ContentView()
//    }
//
