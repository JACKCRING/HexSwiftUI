<p align="left">
  <img src="Sources/PressKits/logo.png" alt="HexSwiftUI" hight="256" />
</p>

<h1 align="left">HexSwiftUI</h1>

<p align="left">
  以一個極輕量的 SwiftUI 擴充套件，從 hex 字串建立 <code>Color</code>。
</p>

<p align="left">
  <a href="#安裝">安裝</a> ·
  <a href="#使用方式">使用方式</a> ·
  <a href="#支援的格式">格式</a> ·
  <a href="#授權">授權</a> ·
  <a href="README.md">English</a>
</p>

---

## 功能特色

- 三種呼叫方式：`Color.hex(_:)`、`Color(hex:)`，以及直接寫字串字面量 `"#000000"`。
- 支援 `#RGB`、`#RRGGBB`、`#RRGGBBAA`（前導 `#` 可省略）。
- 純 SwiftUI，零相依套件。
- 透過 Swift Package Manager 一鍵引入。

## 安裝

### Swift Package Manager

在 Xcode：**File ▸ Add Package Dependencies…**，貼上 repo URL。

或加入到你的 `Package.swift`：

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

## 使用方式

```swift
import SwiftUI
import HexSwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            // 1. 靜態方法
            Text("hello hex")
                .background(Color.hex("#000000"))

            // 2. 具名初始化器
            Text("hello hex")
                .background(Color(hex: "#FF8800AA"))

            // 3. 直接傳字串字面量（ExpressibleByStringLiteral）
            Text("hello hex")
                .background("#000000")
        }
    }
}
```

## 支援的格式

| 格式        | 範例        | 說明              |
| ----------- | ----------- | ----------------- |
| `#RGB`      | `#F80`      | 12 位元簡寫       |
| `#RRGGBB`   | `#FF8800`   | 標準 24 位元      |
| `#RRGGBBAA` | `#FF8800CC` | 32 位元，含透明度 |

前導 `#` 可省略；前後空白會自動修剪。輸入無效時會回退為透明黑，不會造成 crash。

> 備註：刻意不提供 `Color("#RRGGBB")` 這種無標籤的初始化方式，因為這個簽章已被 SwiftUI 內建的「資產名稱」初始化器佔用。字串字面量的支援已能在任何需要 `Color` 的地方達到同樣效果。

## 系統需求

- iOS 14+ · macOS 11+ · tvOS 14+ · watchOS 7+ · visionOS 1+
- Swift 6.0+

## 授權

採用 [MIT License](LICENSE) 授權。

---

<p align="center">
  <a href="https://jackcring.com">JACKCRING ©️ jackcring.com</a>
</p>
