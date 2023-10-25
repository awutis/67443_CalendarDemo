import SwiftUI
import EventKit
import EventKitUI

struct EKEventEditViewControllerWrapper: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let eventStore: EKEventStore
    var event: EKEvent

    func makeUIViewController(context: Context) -> EKEventEditViewController {
        let controller = EKEventEditViewController()
        controller.event = event
        controller.eventStore = eventStore
        controller.editViewDelegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: EKEventEditViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, EKEventEditViewDelegate {
        var parent: EKEventEditViewControllerWrapper

        init(_ parent: EKEventEditViewControllerWrapper) {
            self.parent = parent
        }

        func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
            if action != .canceled {
                // Handle completion (e.g., save event)
            }
            parent.isPresented = false
        }
    }
}
