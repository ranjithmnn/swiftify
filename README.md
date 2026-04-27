# Swiftify 🚀

**Swiftify** brings the elegance of SwiftUI's modifier syntax to Flutter! This package introduces a streamlined way to build Flutter UIs by extending widgets with chainable, modifier-style methods. Say goodbye to deeply nested widget trees and hello to clean, readable, and maintainable code.

[![pub package](https://img.shields.io/pub/v/swiftify.svg)](https://pub.dev/packages/swiftify)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

---

## ✨ Features

- **SwiftUI-like Modifiers** — Apply common widget properties (padding, text styles, shadows, transforms, etc.) with intuitive `.modifier()` methods.
- **Chainable Methods** — Combine multiple modifications into a single statement for a clean, declarative style.
- **Cleaner Codebase** — Reduce widget nesting and improve code readability.
- **Comprehensive Coverage** — 27 extension files covering sizing, layout, decoration, animation, navigation, theming, accessibility, and more.
- **Debug-Friendly Assertions** — Detailed assert messages catch invalid parameters early in development.

---

## 📦 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  swiftify: ^1.5.0
```

Run `flutter pub get`, then import:

```dart
import 'package:swiftify/swiftify.dart';
```

---

## 🔄 Before & After

### Before (deeply nested)
```dart
Center(
  child: Opacity(
    opacity: 0.8,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 10)],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Hello"),
      ),
    ),
  ),
)
```

### After (with Swiftify ✅)
```dart
Text("Hello")
    .padding()
    .shadow(blurRadius: 10)
    .borderRadius(radius: 12)
    .opacity(0.8)
    .center()
```

---

## 📚 API Reference

### 📐 Sizing — `SizingModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.frame(width:, height:)` | Wraps in `SizedBox` with given dimensions |
| `.expanded(flex:)` | Wraps in `Expanded` — must be inside Row/Column/Flex |
| `.flexible(flex:, fit:)` | Wraps in `Flexible` — must be inside Row/Column/Flex |
| `.intrinsicWidth(stepWidth:, stepHeight:)` | Sizes to intrinsic width |
| `.intrinsicHeight()` | Sizes to intrinsic height |
| `.aspectRatio(ratio)` | Enforces an aspect ratio |
| `.fittedBox(fit:, alignment:)` | Scales child within parent |
| `.constrainedBox(minWidth:, maxWidth:, minHeight:, maxHeight:)` | Applies box constraints |
| `.unconstrained(constrainedAxis:, alignment:)` | Removes parent constraints |
| `.limitedBox(maxWidth:, maxHeight:)` | Limits size in unbounded layouts |

```dart
Icon(Icons.star)
    .frame(width: 100, height: 100)
    .expanded(flex: 2)
    .aspectRatio(16 / 9)
```

---

### 🎨 Padding — `PaddingModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.padding(paddingStyle:, padding:, top:, bottom:, left:, right:, vertical:, horizontal:)` | Adds padding with flexible style options |

Supports `PaddingStyle.all`, `PaddingStyle.only`, `PaddingStyle.symmetric`, and `PaddingStyle.fromViewPadding`.

```dart
Text("Hello").padding()                                          // default 8.0 all
Text("Hello").padding(paddingStyle: PaddingStyle.only, top: 16)  // top-only
Text("Hello").padding(paddingStyle: PaddingStyle.symmetric, vertical: 12, horizontal: 24)
```

---

### 🎯 Center — `CenterModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.center()` | Wraps in `Center` widget |

```dart
Text("Centered").center()
```

---

### 📍 Alignment — `AlignmentModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.align(alignment)` | Wraps in `Align` with given alignment |
| `.positioned(top:, bottom:, left:, right:, width:, height:)` | Wraps in `Positioned` for use inside Stack |
| `.positionedFill(top:, bottom:, left:, right:)` | Fills a Stack with optional insets |
| `.centerLeft()` | Aligns to center-left |
| `.centerRight()` | Aligns to center-right |

```dart
Text("Top Left").align(Alignment.topLeft)
widget.positioned(top: 10, left: 20)
widget.positionedFill()
```

---

### 👁️ Visibility — `VisibilityModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.opacity(value)` | Sets opacity (0.0–1.0) |
| `.visible(isVisible, maintainSize:, ...)` | Controls visibility with layout options |
| `.offstage(offstage)` | Removes from layout without removing from tree |
| `.ignorePointer(ignoring:)` | Lets pointer events pass through |
| `.absorbPointer(absorbing:)` | Absorbs pointer events, blocking those below |

```dart
Text("Faded").opacity(0.5)
widget.visible(showWidget, maintainSize: true)
button.ignorePointer(ignoring: isLoading)
```

---

### 🖼️ Container & Background — `ContainerModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.backgroundColor(color)` | Adds a background color |
| `.container(color:, decoration:, padding:, margin:, alignment:, width:, height:)` | Full Container wrapper |

```dart
Text("Hello").backgroundColor(Colors.blue)
widget.container(padding: EdgeInsets.all(16), margin: EdgeInsets.all(8))
```

---

### 🌈 Decoration — `DecorationModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.shadow(color:, blurRadius:, spreadRadius:, offset:, borderRadius:)` | Adds a box shadow |
| `.border(color:, width:, style:, radius:)` | Adds a border |
| `.gradient(gradient, borderRadius:)` | Applies a gradient background |
| `.shape(boxShape, color:)` | Applies a box shape (circle, rectangle) |
| `.decorated(BoxDecoration)` | Full decoration control |
| `.foregroundDecoration(Decoration)` | Overlay decoration |

```dart
widget.shadow(blurRadius: 10, offset: Offset(0, 4))
widget.border(color: Colors.grey, width: 2, radius: 12)
widget.gradient(LinearGradient(colors: [Colors.blue, Colors.purple]))
Image.asset('avatar.png').shape(BoxShape.circle)
```

---

### 🔄 Border Radius — `RadiusModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.borderRadius(radius:, topLeft:, topRight:, bottomLeft:, bottomRight:)` | Clips with rounded corners |

```dart
widget.borderRadius()                         // default 25
widget.borderRadius(radius: 16)               // uniform
widget.borderRadius(topLeft: 20, topRight: 20) // per-corner
```

---

### ✂️ Clip — `ClipModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.clipOval(clipper:, clipBehavior:)` | Clips to oval/ellipse |
| `.clipRect(clipper:, clipBehavior:)` | Clips to rectangle |
| `.clipPath(clipper:, clipBehavior:)` | Clips to custom path |
| `.clipCircle()` | Convenience for circular clip |
| `.clipRoundedRect(radius:, borderRadius:, clipBehavior:)` | Clips to rounded rectangle |

```dart
Image.network(url).clipCircle()
widget.clipRoundedRect(radius: 16)
```

---

### 🔀 Transform — `TransformModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.rotate(angle:, alignment:, origin:)` | Rotates by radians |
| `.rotateDegrees(degrees, alignment:, origin:)` | Rotates by degrees |
| `.scale(all:, scaleX:, scaleY:, alignment:, origin:)` | Scales uniformly or per-axis |
| `.translate(offset:, transformHitTests:)` | Translates position |
| `.flip(flipX:, flipY:, alignment:)` | Mirrors horizontally/vertically |

```dart
Icon(Icons.refresh).rotateDegrees(45)
widget.scale(all: 1.5)
Icon(Icons.arrow_back).flip(flipX: true)
```

---

### 📜 Scroll — `ScrollModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.scrollable(direction:, reverse:, physics:, padding:, controller:)` | Wraps in `SingleChildScrollView` |
| `.scrollbar(controller:, thumbVisibility:, thickness:, radius:)` | Adds a `Scrollbar` |

```dart
Column(children: [...]).scrollable()
ListView(...).scrollbar(thumbVisibility: true)
```

---

### 🛡️ Safe Area — `SafeAreaModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.respectSafeArea()` | Wraps in `SafeArea` |

```dart
Image.asset('bg.png').respectSafeArea()
```

---

### 👆 Gestures — `CombinedGestureModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.onGesture(onTap:, onDoubleTap:, onLongPress:, behavior:)` | Adds gesture detection |

```dart
widget.onGesture(
    onTap: () => print("tapped"),
    onLongPress: () => print("long press"),
)
```

---

### 🎭 Material — `MaterialModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.card(color:, elevation:, shape:, margin:, ...)` | Wraps in `Card` |
| `.material(type:, elevation:, color:, shape:, borderRadius:, ...)` | Wraps in `Material` |
| `.inkWell(onTap:, splashColor:, borderRadius:, ...)` | Adds Material ripple via `InkWell` |

```dart
ListTile(title: Text("Item")).card(elevation: 4)
widget.inkWell(onTap: () => print("tap"), borderRadius: BorderRadius.circular(12))
```

---

### ✍️ Text Styling — `TextModifiers`
*Extension on `Text`*

| Modifier | Description |
|----------|-------------|
| `.fontSize(size)` | Sets font size |
| `.fontWeight(weight)` | Sets font weight |
| `.fontFamily(family)` | Sets font family |
| `.color(color)` | Sets text color |
| `.italic()` | Makes text italic |
| `.bold()` | Makes text bold |
| `.align(textAlign)` | Sets text alignment |

```dart
Text("Hello")
    .fontSize(24)
    .bold()
    .color(Colors.blue)
    .italic()
    .align(TextAlign.center)
```

---

### 🎨 Text Theme — `TextThemeModifier`
*Extension on `Text`*

Apply theme-based text styles directly:

| Modifier | TextTheme Style |
|----------|----------------|
| `.displayLarge(context)` | `textTheme.displayLarge` |
| `.displayMedium(context)` | `textTheme.displayMedium` |
| `.displaySmall(context)` | `textTheme.displaySmall` |
| `.headlineLarge(context)` | `textTheme.headlineLarge` |
| `.headlineMedium(context)` | `textTheme.headlineMedium` |
| `.headlineSmall(context)` | `textTheme.headlineSmall` |
| `.titleLarge(context)` | `textTheme.titleLarge` |
| `.titleMedium(context)` | `textTheme.titleMedium` |
| `.titleSmall(context)` | `textTheme.titleSmall` |
| `.bodyLarge(context)` | `textTheme.bodyLarge` |
| `.bodyMedium(context)` | `textTheme.bodyMedium` |
| `.bodySmall(context)` | `textTheme.bodySmall` |
| `.labelLarge(context)` | `textTheme.labelLarge` |
| `.labelMedium(context)` | `textTheme.labelMedium` |
| `.labelSmall(context)` | `textTheme.labelSmall` |

```dart
Text("Page Title").headlineLarge(context).bold()
Text("Body content").bodyMedium(context).color(Colors.grey)
```

---

### 🎬 Animation — `AnimationModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.hero(tag:, ...)` | Wraps in `Hero` for shared element transitions |
| `.animatedSwitcher(duration:, ...)` | Wraps in `AnimatedSwitcher` |
| `.animatedOpacity(opacity:, duration:, curve:, ...)` | Animated opacity changes |
| `.animatedScale(scale:, duration:, curve:, ...)` | Animated scale changes |
| `.animatedSlide(offset:, duration:, curve:, ...)` | Animated position changes |
| `.animatedRotation(turns:, duration:, curve:, ...)` | Animated rotation changes |
| `.animatedContainer(duration:, padding:, decoration:, ...)` | Animated container properties |
| `.animatedPadding(padding:, duration:, curve:, ...)` | Animated padding changes |

```dart
Image.asset('photo.png').hero(tag: 'photo-1')

widget.animatedOpacity(
    opacity: isVisible ? 1.0 : 0.0,
    duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut,
)

Icon(Icons.refresh).animatedRotation(turns: isLoading ? 1.0 : 0.0)
```

---

### 🧭 Navigation — `NavigationModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.onTapNavigate(context, page:, fullscreenDialog:)` | Pushes a page on tap |
| `.onTapPushNamed(context, routeName:, arguments:)` | Pushes a named route on tap |
| `.showAsDialog(context, dialog:, ...)` | Shows a dialog on tap |
| `.showAsBottomSheet(context, builder:, ...)` | Shows a modal bottom sheet on tap |
| `.onTapPop(context, result:)` | Pops the current route on tap |

```dart
ListTile(title: Text("Settings"))
    .onTapNavigate(context, page: SettingsPage())

Icon(Icons.info).showAsDialog(
    context,
    dialog: AlertDialog(title: Text("Info"), content: Text("Details")),
)

Icon(Icons.arrow_back).onTapPop(context)
```

---

### 🎭 Theme — `ThemeModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.withTheme(ThemeData)` | Overrides theme for subtree |
| `.overrideTheme((current) => ...)` | Copies and modifies current theme |

```dart
widget.withTheme(ThemeData.dark())
widget.overrideTheme((theme) => theme.copyWith(primaryColor: Colors.purple))
```

---

### 🔲 Overlay & Stack — `OverlayModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.overlay(child:, alignment:, fit:, ...)` | Places widget on top via Stack |
| `.stackBackground(child:, alignment:, fit:, ...)` | Places widget behind via Stack |
| `.badge(child:, backgroundColor:, size:, alignment:, ...)` | Adds a badge overlay |

```dart
Image.asset('product.png')
    .overlay(child: Icon(Icons.favorite), alignment: Alignment.topRight)

Icon(Icons.shopping_cart)
    .badge(child: Text("3", style: TextStyle(color: Colors.white, fontSize: 10)))
```

---

### ❓ Conditional — `ConditionalModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.applyIf(condition, modifier)` | Applies modifier only when condition is true |
| `.applyUnless(condition, modifier)` | Applies modifier only when condition is false |
| `.let(transform)` | Pipes widget through a transform function |
| `.withBuilder((context, child) => ...)` | Builder with context access |
| `.when(condition, ifTrue:, ifFalse:)` | Applies one of two modifiers |

```dart
Text("Welcome")
    .applyIf(isLoggedIn, (w) => w.bold())
    .applyIf(isHighlighted, (w) => w.backgroundColor(Colors.yellow))
    .applyUnless(isEnabled, (w) => w.opacity(0.5))

widget.when(
    isDarkMode,
    ifTrue: (w) => w.backgroundColor(Colors.black),
    ifFalse: (w) => w.backgroundColor(Colors.white),
)
```

---

### 📋 List Extensions — `GenericListViewBuilder`
*Extension on `List<T>`*

| Modifier | Description |
|----------|-------------|
| `.asListViewBuilder(itemBuilder:, ...)` | Converts list to `ListView.builder` |
| `.asSeparatedListView(itemBuilder:, separatorBuilder:, ...)` | Converts list to `ListView.separated` |

```dart
final items = ["Apple", "Banana", "Cherry"];

items.asListViewBuilder(
    itemBuilder: (context, index, item) => ListTile(title: Text(item)),
)

items.asSeparatedListView(
    itemBuilder: (context, index, item) => ListTile(title: Text(item)),
    separatorBuilder: (context, index) => Divider(),
)
```

---

### 🔲 Grid Extensions — `GenericGridViewBuilder`
*Extension on `List<T>`*

| Modifier | Description |
|----------|-------------|
| `.asGridView(crossAxisCount:, itemBuilder:, ...)` | Fixed column count grid |
| `.asGridViewExtent(maxCrossAxisExtent:, itemBuilder:, ...)` | Max extent grid |

```dart
items.asGridView(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    itemBuilder: (context, index, item) => Card(child: Center(child: Text(item))),
)
```

---

### 🖼️ Image Modifiers — `ImageModifier`
*Extension on `Image`*

| Modifier | Description |
|----------|-------------|
| `.resizable(fit:)` | Sets the `BoxFit` |
| `.colorBlend(color, mode)` | Applies color blend |
| `.imageSize(width:, height:)` | Sets image dimensions |

```dart
Image.asset('photo.png')
    .resizable(fit: BoxFit.cover)
    .imageSize(width: 200, height: 200)
    .colorBlend(Colors.blue, BlendMode.srcIn)
```

---

### 📱 Responsive — `ResponsiveModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.responsive(mobile:, tablet:, desktop:, ...)` | Breakpoint-based widget switching |
| `.onOrientation(portrait:, landscape:)` | Orientation-based widget switching |
| `.responsivePadding(fraction:, min:, max:)` | Screen-width-based padding |
| `.maxWidth(maxWidth)` | Centers content with max width constraint |

```dart
widget.responsive(
    mobile: MobileLayout(),
    tablet: TabletLayout(),
    desktop: DesktopLayout(),
)

widget.maxWidth(800)  // center-constrained content
widget.responsivePadding(fraction: 0.05)
```

---

### ♿ Semantics & Accessibility — `SemanticsModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.tooltip(message, ...)` | Adds a tooltip |
| `.semanticLabel(label, ...)` | Adds a semantic label for screen readers |
| `.excludeSemantics(excluding:)` | Hides from accessibility tree |
| `.mergeSemantics()` | Merges child semantics into one node |

```dart
IconButton(icon: Icon(Icons.info), onPressed: () {})
    .tooltip('More information')
Image.asset('decoration.png').excludeSemantics()
```

---

### ⌨️ Focus & Keyboard — `FocusModifier`
*Extension on `Widget`*

| Modifier | Description |
|----------|-------------|
| `.dismissKeyboardOnTap()` | Dismisses keyboard on tap |
| `.autoFocus(autofocus:)` | Sets autofocus |
| `.onFocusChange(callback)` | Focus change listener |
| `.focusTraversalGroup(policy:)` | Groups focus traversal |

```dart
Scaffold(body: form).dismissKeyboardOnTap()
TextField().autoFocus()
```

---

### 📜 Sliver Extensions
*Extensions on `Widget` and `List<T>`*

| Modifier | Description |
|----------|-------------|
| `.asSliver()` | Converts to `SliverToBoxAdapter` |
| `.sliverPadding(padding)` | Adds padding to a sliver |
| `.asSliverFillRemaining(...)` | Fills remaining viewport space |
| `.asSliverList(itemBuilder:)` | Converts list to `SliverList` |
| `.asSliverGrid(crossAxisCount:, itemBuilder:, ...)` | Converts list to `SliverGrid` |

```dart
CustomScrollView(
  slivers: [
    Text("Header").padding().asSliver(),
    items.asSliverList(
      itemBuilder: (context, index, item) => ListTile(title: Text(item)),
    ),
    Center(child: Text("End")).asSliverFillRemaining(hasScrollBody: false),
  ],
)
```

---

## 🛡️ Debug Assertions

All modifiers include detailed assertions that catch invalid parameters during development:

```
// ✅ These work fine
widget.opacity(0.5)
widget.frame(width: 100, height: 100)
widget.constrainedBox(minWidth: 50, maxWidth: 200)

// ❌ These throw helpful assertion errors in debug mode
widget.opacity(1.5)
// → 'Opacity must be between 0.0 and 1.0, got 1.5'

widget.frame(width: -10)
// → 'Frame width must be non-negative, got -10.0.'

widget.constrainedBox(minWidth: 200, maxWidth: 50)
// → 'minWidth (200.0) must be less than or equal to maxWidth (50.0).'

widget.flip()
// → 'At least one of "flipX" or "flipY" must be true.'
```

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests on [GitHub](https://github.com/theranjithmenon/swiftify).

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
