import SwiftUI
import FirebaseCore

struct MyView: View {
  var body: some View {
    Text("\(FirebaseApp.app()!.options.projectID!) \(Config.baseUrl)")
      .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}
