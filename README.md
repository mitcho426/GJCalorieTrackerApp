# 📱 Project Guidelines for iOS Calorie Tracker App

Please follow the instructions below for the entire project, including all components, screens, and features:

## 🧱 Architecture & Coding Standards

Use MVVM architecture. Each feature should have its own:
- SwiftUI View
- ViewModel for business logic  
- Model for structured data

Organize files by feature, not type. Example:
```
/Dashboard/
  - DashboardView.swift
  - DashboardViewModel.swift  
  - DashboardModel.swift
```

### ✅ Follow Apple's Official Guidelines:
- Use Apple's Swift API Design Guidelines
- Stick to Apple's coding style:
  - camelCase for variables and functions
  - Descriptive, clear naming (no abbreviations)
  - Correct use of access control (private, internal)
  - Documentation for public methods/types
- Avoid putting logic in views. Keep a clean separation of concerns.

## 🎨 Premium Health Design System

### **COLOR PALETTE - PREMIUM HEALTH:**
```swift
Primary: .indigo (#5856D6) - Trust, intelligence, premium feel
Secondary: .mint (#00D4AA) - Health, progress, achievement  
Accent: .orange (#FF9500) - Action, CTAs, achievements
Surface: .systemBackground with .ultraThinMaterial blur
Text: .primary / .secondary with high contrast
Success: .green, Warning: .orange, Error: .red
```

### **GRADIENTS:**
```swift
Primary: Linear gradient from .indigo to .purple
Success: Linear gradient from .mint to .cyan  
Warning: Linear gradient from .orange to .yellow
Achievement: Linear gradient from .indigo to .mint
Background: Subtle radial gradient from .clear to .gray.opacity(0.1)
```

### **UI DESIGN SYSTEM:**
- **Visual Style**: Premium, sophisticated, professional-grade
- **Personality**: Trustworthy, intelligent, health-focused
- **Target Feel**: Advanced nutrition platform (not basic calorie counter)

### **UI COMPONENTS:**
- Rounded corners (12–16pt)
- Generous padding (16–24pt)  
- Glassmorphism effects: `.ultraThinMaterial` for cards
- Dynamic shadows that respond to content
- SF Pro font with mixed weights for hierarchy
- Spring animations (`.easeInOut`, duration: 0.3s)
- Dark mode optimized with true blacks

### **TYPOGRAPHY SCALE:**
```swift
.largeTitle.weight(.bold) - Main headers (indigo)
.title.weight(.semibold) - Section headers (primary)  
.title2.weight(.medium) - Card titles (primary)
.body.weight(.regular) - Body text (secondary)
.caption.weight(.medium) - Small labels (tertiary)
```

### **ACCESSIBILITY:**
- Support Dynamic Type
- High contrast color ratios (4.5:1 minimum)
- VoiceOver labels for all interactive elements
- Semantic color usage (not just decorative)

### **REUSABLE COMPONENTS:**
```swift
RoundedCardView(content: AnyView, padding: CGFloat = 16)
MacroProgressBar(current: Double, goal: Double, color: Color)  
MealSectionHeader(title: String, calories: Int, action: () -> Void)
FoodItemRow(food: FoodItem, onDelete: () -> Void)
AddFoodButton(style: .floating/.inline, action: () -> Void)
GlassmorphicCard(content: AnyView, blur: Material = .ultraThin)
```

## 🧭 APP NAVIGATION STRUCTURE

```swift
TabView with 4 tabs:
- Dashboard (SF Symbol: "chart.pie.fill") - Primary: indigo
- Food Log (SF Symbol: "list.bullet") - Secondary: mint  
- Add Food (SF Symbol: "plus.circle.fill") - Accent: orange
- Analysis (SF Symbol: "chart.bar.fill") - Primary: indigo

Use NavigationStack (iOS 16+) within each tab
Sheet presentations for Add Food flow
Custom tab bar with premium styling and micro-animations
```

## 🔄 STATE MANAGEMENT PATTERNS

```swift
- Use @StateObject for ViewModels
- @ObservableObject for shared data managers
- @Published for reactive properties
- Combine for async operations and data binding
- UserDefaults for simple preferences
- CoreData for local persistence
```

## ⚠️ ERROR HANDLING & UX PATTERNS

```swift
LOADING STATES:
- ProgressView with descriptive text and indigo tinting
- Skeleton loading for cards and lists
- Shimmer effects for premium feel

ERROR STATES:  
- Alert with retry button (orange accent)
- Inline error messages with helpful guidance
- Graceful degradation for network failures

EMPTY STATES:
- Helpful illustrations with mint accents
- Clear action buttons (orange) with next steps
- Motivational copy aligned with premium brand

SUCCESS FEEDBACK:
- Subtle haptic feedback (.success)
- Green checkmarks with spring animations
- Achievement celebrations with gradient effects
```

## 🌐 Technology Stack

- **iOS 17+** using SwiftUI
- **Swift Charts** for visualizations (styled with premium colors)
- **CoreData** for local persistence (stub if needed)
- **Swift Concurrency** (async/await) and **Combine**

### Use placeholders/mocks for:
- External APIs and services
- Complex data processing
- Any feature-dependent logic

## 📁 File & Folder Structure

Use a scalable, feature-first folder structure:
```
/Views/
/ViewModels/  
/Models/
/Components/ → for reusable UI views
/Services/ → for external integrations
/Resources/ → for color themes, fonts, assets
/Extensions/ → for SwiftUI extensions and utilities
```

Follow naming patterns like:
- `FoodLogView.swift`
- `MacroBreakdownViewModel.swift`  
- `MealCardView.swift`
- `PremiumButton.swift`

## 🔧 INTEGRATION PREPAREDNESS

- Use protocol-based architecture for external services
- Design for async operations with proper loading states
- Include optional fields for advanced features (scores, confidence levels)
- Plan for extensibility and feature integration
- Consistent data naming: `macros` not `nutrition`, `calories` not `energy`

## 🧪 Testing Approach (Optional)

Structure logic-heavy code to be testable:
- Dependency injection for services
- Pure functions for calculations
- Protocol-based architecture for external dependencies

## 💡 PREMIUM BRAND POSITIONING

**App Personality:** Professional-grade nutrition intelligence platform
**Target User:** Health-conscious individuals who want sophisticated insights
**Visual Hierarchy:** Indigo (intelligence) → Mint (health) → Orange (action)

📊 First Features
📊 Prompt 1: Dashboard Screen (Tab 1)
Please build the first tab screen of the app: a Macronutrient Dashboard. This view should follow modern SwiftUI design using RoundedCardView components and a bar chart UI.
The screen should have:
Daily Macronutrient Summary section:
Total Calories
Total Protein (grams)
Total Carbs (grams)
Total Fat (grams)
Each shown with a horizontal progress bar or bar chart, visually representing daily goal completion.
Detailed Macronutrient Breakdown section:
More granular values of each macro:
Carbs → Total Carbs, Sugars, Added Sugars, Fiber, Starches
Protein → Complete amino acid breakdown (Essential amino acids: Histidine, Isoleucine, Leucine, Lysine, Methionine, Phenylalanine, Threonine, Tryptophan, Valine; Non-essential amino acids: Alanine, Arginine, Asparagine, Aspartic acid, Cysteine, Glutamic acid, Glutamine, Glycine, Proline, Serine, Tyrosine), collagen (just stub data for now)
Fats → Saturated, Unsaturated, Trans Fats, Omega-3/6, Poly/Mono fats
Bar graph for each metric
Use RoundedCardView to encapsulate each macro category
Follow the persistent design system and MVVM structure. Use placeholder data in the ViewModel for now.
🥗 Prompt 2: Daily Food Log Screen (Tab 2)
Please build the second tab screen: the Daily Food Log. The layout should include sections for:
Breakfast
Lunch
Dinner
Snacks
Each section should:
Show a list of food items (name, calories, macro summary)
Include an "Add" button to add food to that meal
Use a modern floating AddFoodButton that opens a sheet for food entry
The screen should also show a running daily total of calories/macros at the top of the screen.
Follow the modern design and MVVM structure. Use mock food entries for now in the ViewModel.
➕ Prompt 3: Add Food Flow
Please create the Add Food flow, opened as a sheet from the Food Log screen. The user should be able to add food using:
Manual entry:
Food name
Serving size
Calories, Carbs, Fats, Proteins
Barcode Scanner (stub only):
Add a button with a barcode icon that would call a stubbed barcode scanning service.
Photo Upload Options:
Option to take/upload a picture of the food or ingredients
Simulate sending this image to an LLM/ML service that returns:
swiftstruct FoodEstimationResult {
    let name: String
    let estimatedCalories: Int
    let macros: Macros
}
Use a clean, well-designed SwiftUI sheet with tabs or segmented controls for switching input methods. Stub logic is fine for now.
📊 Prompt 4: Detailed Macronutrient Analysis Screen
Build a dedicated Detailed Macronutrient Analysis screen. This screen should be navigated from the dashboard or from a "See More" link under the macro summary.
Structure the screen into cards or collapsible sections:
Carbohydrates:
Total carbs
Sugars
Added sugars
Starches
Fiber
Proteins:
Total protein
Complete amino acid breakdown (Essential amino acids: Histidine, Isoleucine, Leucine, Lysine, Methionine, Phenylalanine, Threonine, Tryptophan, Valine; Non-essential amino acids: Alanine, Arginine, Asparagine, Aspartic acid, Cysteine, Glutamic acid, Glutamine, Glycine, Proline, Serine, Tyrosine)
Collagen (stub)
Fats:
Saturated
Unsaturated
Trans fats
Omega-3 and Omega-6
Polyunsaturated, Monounsaturated
Vitamins & Minerals:
Stub sample values for vitamins A, B12, D, C, calcium, iron, etc.
Use charts where appropriate, and keep design clean and structured using RoundedCardView.
