//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-29
// Using Shatha

import SwiftUI

struct EventFormView: View {
    @EnvironmentObject var eventStore: EventStore
    @StateObject var viewModel: EventFormViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: Bool?
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Form {
                    DatePicker(selection: $viewModel.date) {
                        Text("Date and Time")
                    }
                    TextField("Note", text: $viewModel.note, axis: .vertical)
                        .focused($focus, equals: true)
                    
                    Picker("Task Type", selection: $viewModel.eventType) {
                        ForEach(Event.EventType.allCases) {eventType in
                            Text(eventType.icon + " " + eventType.rawValue.capitalized)
                                .tag(eventType)
                        }
                    }
                    Section(footer:
                                HStack {
                        Spacer()
                        Button {
                            if viewModel.updating {
                                // update this event
                                let event = Event(id: viewModel.id!,
                                                  eventType: viewModel.eventType,
                                                  date: viewModel.date,
                                                  note: viewModel.note)
                                eventStore.update(event)
                            } else {
                                // create new event
                                let newEvent = Event(eventType: viewModel.eventType,
                                                     date: viewModel.date,
                                                     note: viewModel.note)
                                eventStore.add(newEvent)
                            }
                            dismiss()
                        } label: {
                            Text(viewModel.updating ? "Update Task" : "Add Task")
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(viewModel.incomplete)
                        Spacer()
                    }
                    ) {
                        EmptyView()
                    }
                }
            }
            .navigationTitle(viewModel.updating ? "Update" : "New Task")
            .onAppear {
                focus = true
            }
        }
        
    }
    
}

struct EventFormView_Previews: PreviewProvider {
    static var previews: some View {
        EventFormView(viewModel: EventFormViewModel())
            .environmentObject(EventStore())
    }
}
