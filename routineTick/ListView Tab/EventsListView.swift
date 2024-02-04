//
// Created for UICalendarView_SwiftUI
// by S

import SwiftUI

struct EventsListView: View {
    @State private var showQR = false
    @EnvironmentObject var myEvents: EventStore
    @State private var formType: EventFormType?
    @State private var isMother: Bool = true
    var body: some View {
        NavigationStack {
            List {
                ForEach(myEvents.events.sorted {$0.date < $1.date }) { event in
                    ListViewRow(event: event, formType: $formType)
                        .swipeActions {
                            Button(role: .destructive) {
                                myEvents.delete(event)
                            } label: {
                                Label("Delet", systemImage: "trash")
                                
                            }
                            if isMother{
                            Button {
                                formType = .update(event)
                            } label: {
                                Label("Edit", systemImage: "pencil")
                                    .foregroundStyle(.purple)
                            }
                            .tint(.orange)
                            .foregroundColor(.purple)
                        }
                }
                }
            }
            .navigationTitle("Calendar Task")
            .sheet(item: $formType) { $0 }
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    
                    
                    Button(action: {showQR.toggle()}){
                        Image(systemName: "qrcode")
                            .foregroundColor(.purple)
                    }
                    if isMother{
                        Button {
                            formType = .new
                        } label: {
                            Image(systemName:"plus.app")
                                .foregroundColor(Color.purple)
                                .imageScale(.medium)
                        }
                    }
                }
            }
        }
    }
    
    struct EventsListView_Previews: PreviewProvider {
        static var previews: some View {
            EventsListView()
                .environmentObject(EventStore(preview: true))
        }
    }
}
