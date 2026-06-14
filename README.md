<p align="center">
  <img src="Sources/PressKits/logo.png" alt="HexSwiftUI" width="256" />
</p>

<h1 align="center">HexSwiftUI</h1>

<p align="center">
  A tiny SwiftUI extension that lets you build <code>Color</code> from hex strings.
</p>

<p align="center">
  <a href="#installation">Installation</a> ·
  <a href="#usage">Usage</a> ·
  <a href="#supported-formats">Formats</a> ·
  <a href="#license">License</a> ·
  <a href="README.zh-Hant.md">繁體中文</a>
</p>

---

## Features

- Three call styles: `Color.hex(_:)`, `Color(hex:)`, and bare string literals like `"#000000"`.
- Supports `#RGB`, `#RRGGBB`, and `#RRGGBBAA` (the `#` is optional).
- Pure SwiftUI, zero dependencies.
- Drop in with Swift Package Manager.

## Installation

### Swift Package Manager

In Xcode: **File ▸ Add Package Dependencies…** and paste the repository URL.

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/jackcring/HexSwiftUI.git", from: "1.0.0")
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["HexSwiftUI"]
    )
]
```

## Usage

```swift
import SwiftUI
import HexSwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            // 1. Static method
            Text("hello hex")
                .background(Color.hex("#000000"))

            // 2. Labeled initializer
            Text("hello hex")
                .background(Color(hex: "#FF8800AA"))

            // 3. Bare string literal (ExpressibleByStringLiteral)
            Text("hello hex")
                .background("#000000")
        }
    }
}
```

## Supported Formats

| Format      | Example     | Notes              |
| ----------- | ----------- | ------------------ |
| `#RGB`      | `#F80`      | 12-bit shorthand   |
| `#RRGGBB`   | `#FF8800`   | Standard 24-bit    |
| `#RRGGBBAA` | `#FF8800CC` | 32-bit, with alpha |

The leading `#` is optional. Whitespace is trimmed. Invalid input falls back to clear black so your UI never crashes.

> Note: `Color("#RRGGBB")` without a label is intentionally not provided — that signature is already used by SwiftUI's asset-name initializer. The string-literal conformance covers the same ergonomic goal anywhere a `Color` is expected.

## Requirements

- iOS 14+ · macOS 11+ · tvOS 14+ · watchOS 7+ · visionOS 1+
- Swift 6.0+

## License

Released under the [MIT License](LICENSE).

---

<p align="center">
  <a href="https://jackcring.com">JACKCRING ©️ jackcring.com</a>
</p>
