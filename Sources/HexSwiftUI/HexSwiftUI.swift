//
//  HexSwiftUI.swift
//  HexSwiftUI
//
//  A lightweight SwiftUI extension that lets you create `Color` from hex strings.
//
//  Usage:
//      Color.hex("#FF8800")
//      Color(hex: "#FF8800AA")
//      Text("hello hex").background("#000000")   // via ExpressibleByStringLiteral
//

import SwiftUI

// MARK: - Hex Initializers

public extension Color {
    /// Creates a `Color` from a hex string.
    ///
    /// Supported formats (the leading `#` is optional):
    /// - `"#RGB"`       (12-bit)
    /// - `"#RRGGBB"`    (24-bit)
    /// - `"#RRGGBBAA"`  (32-bit, with alpha)
    ///
    /// Invalid input falls back to clear black.
    init(hex: String) {
        let (r, g, b, a) = Color.parseHex(hex)
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }

    /// Creates a `Color` from a hex string. Convenience static method.
    ///
    ///     Text("hi").background(Color.hex("#000000"))
    static func hex(_ string: String) -> Color {
        Color(hex: string)
    }
}

// MARK: - String Literal Support

extension Color: @retroactive ExpressibleByStringLiteral {
    /// Allows passing a hex string literal directly where a `Color` is expected.
    ///
    ///     Text("hi").background("#000000")
    public init(stringLiteral value: String) {
        self.init(hex: value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(hex: value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(hex: value)
    }
}

// MARK: - Parsing

private extension Color {
    static func parseHex(_ string: String) -> (Double, Double, Double, Double) {
        var hex = string.trimmingCharacters(in: .whitespacesAndNewlines)
        if hex.hasPrefix("#") { hex.removeFirst() }

        var value: UInt64 = 0
        guard Scanner(string: hex).scanHexInt64(&value) else {
            return (0, 0, 0, 0)
        }

        switch hex.count {
        case 3: // RGB
            let r = Double((value >> 8) & 0xF) / 15
            let g = Double((value >> 4) & 0xF) / 15
            let b = Double(value & 0xF) / 15
            return (r, g, b, 1)
        case 6: // RRGGBB
            let r = Double((value >> 16) & 0xFF) / 255
            let g = Double((value >> 8) & 0xFF) / 255
            let b = Double(value & 0xFF) / 255
            return (r, g, b, 1)
        case 8: // RRGGBBAA
            let r = Double((value >> 24) & 0xFF) / 255
            let g = Double((value >> 16) & 0xFF) / 255
            let b = Double((value >> 8) & 0xFF) / 255
            let a = Double(value & 0xFF) / 255
            return (r, g, b, a)
        default:
            return (0, 0, 0, 0)
        }
    }
}
