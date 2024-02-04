//
//  TabView.swift
//  routineTick
//
//  Created by Deemh Albaqami on 20/07/1445 AH.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject var myEvents: EventStore
    var body: some View {
        TabView{
            EventsListView()
                .tabItem {
                    Label("Today", systemImage: "checklist")
                }
            
            EventsCalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            
            RuleView(ruleManager: RuleManager(), isHousewife: true)
                .tabItem {
                    Label("Stories", systemImage: "book.pages")
                }
        }
        .accentColor(Color("MainColor"))
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
            .environmentObject(EventStore(preview: true))
    }
}
