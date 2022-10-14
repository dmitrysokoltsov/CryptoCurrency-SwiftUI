import Foundation
import SwiftUI

extension UIApplication  {
    func editEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
