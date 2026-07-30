import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure ConsumptionSet where
  bundleType : Type u
  feasibleConsumption : Prop
  convexity : Prop
  closedness : Prop
  boundednessBelow : Prop

structure PreferenceRelation (C : ConsumptionSet) where
  preference : C.bundleType -> C.bundleType -> Prop
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  monotonicity : Prop
  convexity : Prop

structure UtilityFunction {C : ConsumptionSet} (P : PreferenceRelation C) where
  u : C.bundleType -> ℝ
  representsPreference : ∀ x y : C.bundleType, P.preference x y ↔ u x ≥ u y
  continuity : Prop
  strictMonotonicity : Prop
  quasiconcavity : Prop

structure UtilityFunctionEvidence {C : ConsumptionSet} {P : PreferenceRelation C}
    (U : UtilityFunction P) where
  representsPreferenceClosed : U.representsPreference
  continuityClosed : U.continuity
  strictMonotonicityClosed : U.strictMonotonicity
  quasiconcavityClosed : U.quasiconcavity

def UtilityFunctionClosed {C : ConsumptionSet} {P : PreferenceRelation C}
    (U : UtilityFunction P) : Prop :=
  U.representsPreference ∧ U.continuity ∧
  U.strictMonotonicity ∧ U.quasiconcavity

theorem utility_function_closed_from_evidence {C : ConsumptionSet}
    {P : PreferenceRelation C} (U : UtilityFunction P)
    (E : UtilityFunctionEvidence U) : UtilityFunctionClosed U := by
  exact And.intro E.representsPreferenceClosed
    (And.intro E.continuityClosed
      (And.intro E.strictMonotonicityClosed E.quasiconcavityClosed))

end HautevilleHouse
end EconomicsPoliticalEconomyCanonicalLaneLean
