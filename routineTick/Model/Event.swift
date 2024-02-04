import Foundation

struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case work, cook, Elderlycare, Event, Childcare, unspecified
        var id: String {
            self.rawValue
        }
        var icon: String {
            switch self {
            case .work:
                return "🧺"
            case .cook:
                return "👩🏼‍🍳"
            case .Elderlycare:
                return "👵🏼"
            case .Event:
                return "👨‍👩‍👧‍👦"
            case .Childcare:
                return "👩🏻‍🍼"
            case .unspecified:
                return "🏡"
            }
        }
    }

    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    var isCompleted : Bool
    var eventID = UUID()

    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    init(id: String = UUID().uuidString, eventType: EventType = .unspecified, date: Date, note: String, isCompleted: Bool = false) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
        self.isCompleted = isCompleted // This line
    }

    // Data to be used in the preview
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .cook, date: Date().addingTimeInterval(3600), note: "Making breakfast"),
            Event(date: Date().addingTimeInterval(-86400), note: "dish washing"),
            Event(eventType: .Elderlycare, date: Date().addingTimeInterval(518400), note: "Elderly care"),
            Event(eventType: .work, date: Date().addingTimeInterval(172800), note: "clothes washing"),
            Event(eventType: .work, date: Date().addingTimeInterval(-86400), note: "Sweep the house"),
            Event(eventType: .Childcare, date: Date().addingTimeInterval(-259200), note: "Babysitting"),
            Event(date: Date().addingTimeInterval(-345600), note: "Making lunch")
        ]
    }
}
