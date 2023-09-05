#  Notes to Self
This is the Day 47 challenge project from Paul Hudson's 100 Days of SwiftUI

## Questions for Mastodon
- do I need to extend Color? I think not
- is the reason I cannot add change colors on the TextFields because they're inside a Form?

## Color+Extension.swift

import Foundation
import SwiftUI

extension Color {
    static let primary = Color("Primary")
    static let secondary = Color("Secondary")
    static let accent1 = Color("Accent1")
    static let accent2 = Color("Accent2")
    static let neutralBase = Color("NeutralBase")
    static let textColor = Color("TextColor")
    static let goldenYellow = Color("GoldenYellow")
    static let pastelPink = Color("PastelPink")
}
