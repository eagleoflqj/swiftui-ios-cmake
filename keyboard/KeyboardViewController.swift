import UIKit
import SwiftUI

class KeyboardViewController: UIInputViewController {
  var hostingController: UIHostingController<KeyboardView>!
  static var shared: KeyboardViewController!

  override func viewDidLoad() {
    super.viewDidLoad()
    hostingController = UIHostingController(rootView: KeyboardView())
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
  }

  override func viewWillAppear(_ animated: Bool) {
    Self.shared = self
    addChild(hostingController)
    view.addSubview(hostingController.view)

    NSLayoutConstraint.activate([
      hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
      hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])

    hostingController.didMove(toParent: self)
  }
}
