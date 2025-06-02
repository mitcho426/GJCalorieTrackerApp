import Combine
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var dailySummary: MacroSet
    @Published var carbDetails: CarbDetails
    @Published var proteinDetails: ProteinDetails
    @Published var fatDetails: FatDetails

    init() {
        // Initialize dailySummary with placeholder data
        self.dailySummary = MacroSet(
            calories: 1500, protein: 70, carbs: 180, fat: 50,
            goalCalories: 2000, goalProtein: 120, goalCarbs: 250, goalFat: 70
        )

        // Initialize carbDetails with placeholder data
        self.carbDetails = CarbDetails(
            totalCarbs: 180, sugars: 60, addedSugars: 20, fiber: 25, starches: 75,
            goalTotalCarbs: 250, goalSugars: 50, goalAddedSugars: 25, goalFiber: 30, goalStarches: 145
        )

        // Initialize proteinDetails with placeholder data
        self.proteinDetails = ProteinDetails(
            // Essential Amino Acids
            histidine: 1.0, isoleucine: 2.0, leucine: 3.0, lysine: 2.5, methionine: 1.5,
            phenylalanine: 2.2, threonine: 1.8, tryptophan: 0.5, valine: 2.8,
            goalHistidine: 2.0, goalIsoleucine: 3.0, goalLeucine: 4.0, goalLysine: 3.5, goalMethionine: 2.5,
            goalPhenylalanine: 3.2, goalThreonine: 2.8, goalTryptophan: 1.0, goalValine: 3.8,

            // Non-Essential Amino Acids
            alanine: 3.0, arginine: 4.0, asparagine: 2.0, asparticAcid: 3.5, cysteine: 1.0,
            glutamicAcid: 5.0, glutamine: 4.5, glycine: 2.5, proline: 3.0, serine: 2.0, tyrosine: 1.5,
            goalAlanine: 4.0, goalArginine: 5.0, goalAsparagine: 3.0, goalAsparticAcid: 4.5, goalCysteine: 2.0,
            goalGlutamicAcid: 6.0, goalGlutamine: 5.5, goalGlycine: 3.5, goalProline: 4.0, goalSerine: 3.0, goalTyrosine: 2.5,

            // Other
            collagen: 10.0,
            goalCollagen: 15.0
        )

        // Initialize fatDetails with placeholder data
        self.fatDetails = FatDetails(
            totalFat: 50, saturated: 15, unsaturated: 25, transFats: 1,
            omega3: 1.5, omega6: 3, polyUnsaturated: 10, monoUnsaturated: 15,
            goalTotalFat: 70, goalSaturated: 20, goalUnsaturated: 40, goalTransFats: 0,
            goalOmega3: 2, goalOmega6: 4, goalPolyUnsaturated: 15, goalMonoUnsaturated: 25
        )
    }
}
