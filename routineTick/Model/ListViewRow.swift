
//

import SwiftUI

struct ListViewRow: View {
    var event: Event
    @EnvironmentObject var myEvents: EventStore
    @Binding var formType: EventFormType?
    @State private var checKmarkTapped:Bool = false
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(event.eventType.icon)
                        .font(.system(size: 40))
                    Text(event.note)
                }
                Text(
                    event.date.formatted(date: .abbreviated,
                                         time: .shortened)
                )
            }
            Spacer()
            Button {
                            withAnimation {
                                myEvents.toggleCompletion(event)
                            }
                        } label: {
                            Image(systemName: event.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(event.isCompleted ? .purple : .gray)
                                .font(.title2)
                        }
                        .buttonStyle(.plain)
                        .foregroundColor(Color.purple)
          
            }
           

        }
    }


 struct ListViewRow_Previews: PreviewProvider {
     static let event = Event(eventType: .work, date: Date(), note: "Clean")
    static var previews: some View {
        ListViewRow(event: event, formType: .constant(.new))
    }
 }
