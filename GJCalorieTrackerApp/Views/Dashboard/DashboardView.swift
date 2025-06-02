import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // MARK: - Daily Macronutrient Summary
                // Text("Daily Summary") // Removed as per request
                //     .font(.largeTitle.weight(.bold))
                //     .foregroundColor(Color.premiumIndigo)
                //     .frame(maxWidth: .infinity, alignment: .leading)

                RoundedCardView {
                    VStack(alignment: .center, spacing: 20) { // Adjusted main VStack spacing
                        Text("Macronutrients") // Card title
                            .font(.title.weight(.semibold))
                            .foregroundColor(Color.premiumIndigo)
                            .frame(maxWidth: .infinity, alignment: .leading) // Keep title aligned left

                        // Calories CircularProgressView
                        CircularProgressView(
                            progress: viewModel.dailySummary.calories / (viewModel.dailySummary.goalCalories == 0 ? 1 : viewModel.dailySummary.goalCalories),
                            color: Color.premiumOrange,
                            lineWidth: 12,
                            label: String(format: "%.0f\nKCAL", viewModel.dailySummary.calories),
                            labelFont: .title3.weight(.bold) // Larger font for calorie circle label
                        )
                        .frame(width: 120, height: 120)
                        .padding(.bottom, 5) // Adjusted padding

                        // HStack for Protein, Carbs, Fat CircularProgressViews
                        HStack(spacing: 15) {
                            CircularProgressView(
                                progress: viewModel.dailySummary.protein / (viewModel.dailySummary.goalProtein == 0 ? 1 : viewModel.dailySummary.goalProtein),
                                color: Color.premiumIndigo,
                                lineWidth: 8,
                                label: String(format: "%.0fg\nPRO", viewModel.dailySummary.protein)
                                // No labelFont specified, uses default .caption.weight(.medium)
                            )
                            .frame(width: 70, height: 70)

                            CircularProgressView(
                                progress: viewModel.dailySummary.carbs / (viewModel.dailySummary.goalCarbs == 0 ? 1 : viewModel.dailySummary.goalCarbs),
                                color: Color.premiumMint,
                                lineWidth: 8,
                                label: String(format: "%.0fg\nCHO", viewModel.dailySummary.carbs)
                                // No labelFont specified, uses default .caption.weight(.medium)
                            )
                            .frame(width: 70, height: 70)

                            CircularProgressView(
                                progress: viewModel.dailySummary.fat / (viewModel.dailySummary.goalFat == 0 ? 1 : viewModel.dailySummary.goalFat),
                                color: Color.premiumOrange.opacity(0.7),
                                lineWidth: 8,
                                label: String(format: "%.0fg\nFAT", viewModel.dailySummary.fat)
                                // No labelFont specified, uses default .caption.weight(.medium)
                            )
                            .frame(width: 70, height: 70)
                        }
                        .padding(.bottom, 15) // Adjusted padding, spacing before horizontal bars

                        MacroProgressBar(
                            label: "Calories",
                            currentValue: viewModel.dailySummary.calories,
                            goalValue: viewModel.dailySummary.goalCalories,
                            color: .premiumOrange, // Accent color
                            unit: "kcal",
                            labelFont: .callout.weight(.semibold),
                            valueFont: .callout
                        )

                        // Removed old "Macronutrients" sub-header text here

                        MacroProgressBar(
                            label: "Protein",
                            currentValue: viewModel.dailySummary.protein,
                            goalValue: viewModel.dailySummary.goalProtein,
                            color: .premiumIndigo, // Primary color
                            unit: "g",
                            labelFont: .callout.weight(.semibold),
                            valueFont: .callout
                        )
                        MacroProgressBar(
                            label: "Carbs",
                            currentValue: viewModel.dailySummary.carbs,
                            goalValue: viewModel.dailySummary.goalCarbs,
                            color: .premiumMint, // Secondary color
                            unit: "g",
                            labelFont: .callout.weight(.semibold),
                            valueFont: .callout
                        )
                        MacroProgressBar(
                            label: "Fat",
                            currentValue: viewModel.dailySummary.fat,
                            goalValue: viewModel.dailySummary.goalFat,
                            color: Color.premiumOrange.opacity(0.7), // Distinct color
                            unit: "g",
                            labelFont: .callout.weight(.semibold),
                            valueFont: .callout
                        )
                    }
                }

                // MARK: - Detailed Macronutrient Breakdown
                Text("Detailed Breakdown") // This title remains
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(Color.premiumIndigo)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Carbs Card
                RoundedCardView {
                    VStack(alignment: .leading, spacing: 12) { // Adjusted spacing
                        Text("Carbohydrates")
                            .font(.title.weight(.semibold))
                            .foregroundColor(Color.premiumMint)
                            .padding(.bottom, 4)

                        MacroProgressBar(label: "Total Carbs", currentValue: viewModel.carbDetails.totalCarbs, goalValue: viewModel.carbDetails.goalTotalCarbs, color: Color.premiumMint, unit: "g")
                        MacroProgressBar(label: "Sugars", currentValue: viewModel.carbDetails.sugars, goalValue: viewModel.carbDetails.goalSugars, color: Color.premiumMint.opacity(0.8), unit: "g")
                        MacroProgressBar(label: "Added Sugars", currentValue: viewModel.carbDetails.addedSugars, goalValue: viewModel.carbDetails.goalAddedSugars, color: Color.premiumMint.opacity(0.6), unit: "g")
                        MacroProgressBar(label: "Fiber", currentValue: viewModel.carbDetails.fiber, goalValue: viewModel.carbDetails.goalFiber, color: Color.premiumMint.opacity(0.7), unit: "g")
                        MacroProgressBar(label: "Starches", currentValue: viewModel.carbDetails.starches, goalValue: viewModel.carbDetails.goalStarches, color: Color.premiumMint.opacity(0.5), unit: "g")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                // Protein Card
                RoundedCardView {
                    VStack(alignment: .leading, spacing: 12) { // Adjusted spacing
                        Text("Protein")
                            .font(.title.weight(.semibold))
                            .foregroundColor(Color.premiumIndigo)
                            .padding(.bottom, 4)

                        MacroProgressBar(label: "Leucine", currentValue: viewModel.proteinDetails.leucine, goalValue: viewModel.proteinDetails.goalLeucine, color: Color.premiumIndigo.opacity(0.8), unit: "g")
                        MacroProgressBar(label: "Lysine", currentValue: viewModel.proteinDetails.lysine, goalValue: viewModel.proteinDetails.goalLysine, color: Color.premiumIndigo.opacity(0.7), unit: "g")
                        MacroProgressBar(label: "Glutamine", currentValue: viewModel.proteinDetails.glutamine, goalValue: viewModel.proteinDetails.goalGlutamine, color: Color.premiumIndigo.opacity(0.6), unit: "g")
                        MacroProgressBar(label: "Collagen", currentValue: viewModel.proteinDetails.collagen, goalValue: viewModel.proteinDetails.goalCollagen, color: Color.premiumIndigo.opacity(0.5), unit: "g")
                        Text("Other amino acids not shown for brevity.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.top, 4)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                // Fats Card
                RoundedCardView {
                    VStack(alignment: .leading, spacing: 12) { // Adjusted spacing
                        Text("Fats")
                            .font(.title.weight(.semibold))
                            .foregroundColor(Color.premiumOrange)
                            .padding(.bottom, 4)

                        MacroProgressBar(label: "Total Fat", currentValue: viewModel.fatDetails.totalFat, goalValue: viewModel.fatDetails.goalTotalFat, color: Color.premiumOrange, unit: "g")
                        MacroProgressBar(label: "Saturated", currentValue: viewModel.fatDetails.saturated, goalValue: viewModel.fatDetails.goalSaturated, color: Color.premiumOrange.opacity(0.8), unit: "g")
                        MacroProgressBar(label: "Unsaturated", currentValue: viewModel.fatDetails.unsaturated, goalValue: viewModel.fatDetails.goalUnsaturated, color: Color.premiumOrange.opacity(0.7), unit: "g")
                        MacroProgressBar(label: "Trans Fats", currentValue: viewModel.fatDetails.transFats, goalValue: viewModel.fatDetails.goalTransFats, color: Color.red, unit: "g") // Using .red for trans fats
                        MacroProgressBar(label: "Omega-3", currentValue: viewModel.fatDetails.omega3, goalValue: viewModel.fatDetails.goalOmega3, color: Color.premiumOrange.opacity(0.6), unit: "g")
                        MacroProgressBar(label: "Omega-6", currentValue: viewModel.fatDetails.omega6, goalValue: viewModel.fatDetails.goalOmega6, color: Color.premiumOrange.opacity(0.5), unit: "g")
                        // Poly and Mono unsaturated are not explicitly in FatDetails, 'unsaturated' is a general term.
                        // If more specific data becomes available, these can be added.
                        // MacroProgressBar(label: "Polyunsaturated", currentValue: viewModel.fatDetails.polyUnsaturated, goalValue: viewModel.fatDetails.goalPolyUnsaturated, color: Color.premiumOrange.opacity(0.4), unit: "g")
                        // MacroProgressBar(label: "Monounsaturated", currentValue: viewModel.fatDetails.monoUnsaturated, goalValue: viewModel.fatDetails.goalMonoUnsaturated, color: Color.premiumOrange.opacity(0.3), unit: "g")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding() // Padding for the main VStack content within ScrollView
        }
        .navigationTitle("Dashboard") // Optional: If used within a NavigationView
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .preferredColorScheme(.dark) // Example: Preview in dark mode
        DashboardView()
            .preferredColorScheme(.light) // Example: Preview in light mode
    }
}
