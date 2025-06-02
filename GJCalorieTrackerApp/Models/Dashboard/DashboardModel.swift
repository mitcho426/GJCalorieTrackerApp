import Foundation

struct MacroSet {
    var calories: Double
    var protein: Double
    var carbs: Double
    var fat: Double

    var goalCalories: Double
    var goalProtein: Double
    var goalCarbs: Double
    var goalFat: Double
}

struct CarbDetails {
    var totalCarbs: Double
    var sugars: Double
    var addedSugars: Double
    var fiber: Double
    var starches: Double

    var goalTotalCarbs: Double
    var goalSugars: Double
    var goalAddedSugars: Double
    var goalFiber: Double
    var goalStarches: Double
}

struct ProteinDetails {
    // Essential Amino Acids
    var histidine: Double
    var isoleucine: Double
    var leucine: Double
    var lysine: Double
    var methionine: Double
    var phenylalanine: Double
    var threonine: Double
    var tryptophan: Double
    var valine: Double

    var goalHistidine: Double
    var goalIsoleucine: Double
    var goalLeucine: Double
    var goalLysine: Double
    var goalMethionine: Double
    var goalPhenylalanine: Double
    var goalThreonine: Double
    var goalTryptophan: Double
    var goalValine: Double

    // Non-Essential Amino Acids
    var alanine: Double
    var arginine: Double
    var asparagine: Double
    var asparticAcid: Double
    var cysteine: Double
    var glutamicAcid: Double
    var glutamine: Double
    var glycine: Double
    var proline: Double
    var serine: Double
    var tyrosine: Double

    var goalAlanine: Double
    var goalArginine: Double
    var goalAsparagine: Double
    var goalAsparticAcid: Double
    var goalCysteine: Double
    var goalGlutamicAcid: Double
    var goalGlutamine: Double
    var goalGlycine: Double
    var goalProline: Double
    var goalSerine: Double
    var goalTyrosine: Double

    // Other
    var collagen: Double
    var goalCollagen: Double
}

struct FatDetails {
    var totalFat: Double
    var saturated: Double
    var unsaturated: Double
    var transFats: Double
    var omega3: Double
    var omega6: Double
    var polyUnsaturated: Double
    var monoUnsaturated: Double

    var goalTotalFat: Double
    var goalSaturated: Double
    var goalUnsaturated: Double
    var goalTransFats: Double
    var goalOmega3: Double
    var goalOmega6: Double
    var goalPolyUnsaturated: Double
    var goalMonoUnsaturated: Double
}
