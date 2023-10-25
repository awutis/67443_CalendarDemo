//
//  ContentView.swift
//  EventUIKit_Demo2
//
//  Created by Annie Wu on 2023-10-24.
//

import Foundation
import SwiftUI
import EventKit
import EventKitUI

struct ContentView: View {
    @State private var isEventPickerPresented = false
    @State private var eventStore = EKEventStore()
    @State private var event = EKEvent(eventStore: EKEventStore())

    var body: some View {
        Button("Add Event") {
            event.title = "My Custom Event"
            event.startDate = Date()
            event.endDate = Date().addingTimeInterval(3600) // 1 hour later
            event.location = "Custom Location"
            event.notes = "This is a custom event created in SwiftUI."
            
            isEventPickerPresented.toggle()
        }
        .sheet(isPresented: $isEventPickerPresented) {
            EKEventEditViewControllerWrapper(
                isPresented: $isEventPickerPresented,
                eventStore: eventStore,
                event: event
            )
        }
    }
}

