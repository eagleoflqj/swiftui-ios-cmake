import SwiftUI

struct KeyboardView: View {
  var body: some View {
    VStack {
      Button {
        KeyboardViewController.shared.textDocumentProxy.insertText("a")
      } label: {
        Text("a")
      }
    }.frame(height: 200)
  }
}
