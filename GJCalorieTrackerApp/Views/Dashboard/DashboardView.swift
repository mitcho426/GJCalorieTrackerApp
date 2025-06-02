import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // MARK: - Daily Macronutrient Summary
                Text("Daily Summary")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(Color.premiumIndigo)
                    .frame(maxWidth: .infinity, alignment: .leading)

                RoundedCardView {
                    VStack(spacing: 16) {
                        MacroProgressBar(
                            label: "Calories",
                            currentValue: viewModel.dailySummary.calories,
                            goalValue: viewModel.dailySummary.goalCalories,
                            color: .premiumOrange, // Accent color
                            unit: "kcal"
                        )

                        Text("Macronutrients")
                            .font(.title2.weight(.semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        MacroProgressBar(
                            label: "Protein",
                            currentValue: viewModel.dailySummary.protein,
                            goalValue: viewModel.dailySummary.goalProtein,
                            color: .premiumIndigo, // Primary color
                            unit: "g"
                        )
                        MacroProgressBar(
                            label: "Carbs",
                            currentValue: viewModel.dailySummary.carbs,
                            goalValue: viewModel.dailySummary.goalCarbs,
                            color: .premiumMint, // Secondary color
                            unit: "g"
                        )
                        MacroProgressBar(
                            label: "Fat",
                            currentValue: viewModel.dailySummary.fat,
                            goalValue: viewModel.dailySummary.goalFat,
                            color: Color.premiumOrange.opacity(0.7), // Distinct color
                            unit: "g"
                        )
                    }
                }

                // MARK: - Detailed Macronutrient Breakdown
                Text("Detailed Breakdown")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(Color.premiumIndigo)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Carbs Card
                RoundedCardView {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Carbohydrates")
                            .font(.title.weight(.semibold))
                            .foregroundColor(Color.premiumMint)
                            .padding(.bottom, 4)

                        Text("Total Carbs: \(viewModel.carbDetails.totalCarbs, specifier: "%.0f")g / \(viewModel.carbDetails.goalTotalCarbs, specifier: "%.0f")g")
                        Text("Sugars: \(viewModel.carbDetails.sugars, specifier: "%.0f")g / \(viewModel.carbDetails.goalSugars, specifier: "%.0f")g")
                        Text("Added Sugars: \(viewModel.carbDetails.addedSugars, specifier: "%.0f")g / \(viewModel.carbDetails.goalAddedSugars, specifier: "%.0f")g")
                        Text("Fiber: \(viewModel.carbDetails.fiber, specifier: "%.0f")g / \(viewModel.carbDetails.goalFiber, specifier: "%.0f")g")
                        Text("Starches: \(viewModel.carbDetails.starches, specifier: "%.0f")g / \(viewModel.carbDetails.goalStarches, specifier: "%.0f")g")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                // Protein Card
                RoundedCardView {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Protein")
                            .font(.title.weight(.semibold))
                            .foregroundColor(Color.premiumIndigo)
                            .padding(.bottom, 4)

                        // Placeholder for total protein. Summing all amino acids is verbose and ideally handled in ViewModel or Model.
                        Text("Total Protein: \(viewModel.dailySummary.protein, specifier: "%.0f")g / \(viewModel.dailySummary.goalProtein, specifier: "%.0f")g")
                        Text("Histidine: \(viewModel.proteinDetails.histidine, specifier: "%.1f")g / \(viewModel.proteinDetails.goalHistidine, specifier: "%.1f")g")
                        Text("Leucine: \(viewModel.proteinDetails.leucine, specifier: "%.1f")g / \(viewModel.proteinDetails.goalLeucine, specifier: "%.1f")g")
                        Text("Lysine: \(viewModel.proteinDetails.lysine, specifier: "%.1f")g / \(viewModel.proteinDetails.goalLysine, specifier: "%.1f")g")
                        Text("Collagen: \(viewModel.proteinDetails.collagen, specifier: "%.1f")g / \(viewModel.proteinDetails.goalCollagen, specifier: "%.1f")g")
                        Text("More detailed amino acid breakdown available...")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                // Fats Card
                RoundedCardView {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Fats")
                            .font(.title.weight(.semibold))
                            .foregroundColor(Color.premiumOrange)
                            .padding(.bottom, 4)

                        Text("Total Fat: \(viewModel.fatDetails.totalFat, specifier: "%.0f")g / \(viewModel.fatDetails.goalTotalFat, specifier: "%.0f")g")
                        Text("Saturated: \(viewModel.fatDetails.saturated, specifier: "%.0f")g / \(viewModel.fatDetails.goalSaturated, specifier: "%.0f")g")
                        Text("Unsaturated: \(viewModel.fatDetails.unsaturated, specifier: "%.0f")g / \(viewModel.fatDetails.goalUnsaturated, specifier: "%.0f")g")
                        Text("Trans Fats: \(viewModel.fatDetails.transFats, specifier: "%.0f")g / \(viewModel.fatDetails.goalTransFats, specifier: "%.0f")g")
                        Text("Omega-3: \(viewModel.fatDetails.omega3, specifier: "%.1f")g / \(viewModel.fatDetails.goalOmega3, specifier: "%.1f")g")
                        Text("Omega-6: \(viewModel.fatDetails.omega6, specifier: "%.1f")g / \(viewModel.fatDetails.goalOmega6, specifier: "%.1f")g")
                        Text("Polyunsaturated: \(viewModel.fatDetails.polyUnsaturated, specifier: "%.0f")g / \(viewModel.fatDetails.goalPolyUnsaturated, specifier: "%.0f")g")
                        Text("Monounsaturated: \(viewModel.fatDetails.monoUnsaturated, specifier: "%.0f")g / \(viewModel.fatDetails.goalMonoUnsaturated, specifier: "%.0f")g")
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
    }
}
