import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure UtilityPreferenceBridge where
  consumptionSet : Type
  preferenceRelation : consumptionSet → consumptionSet → Prop
  utilityFunction : consumptionSet → ℝ
  representationProperty : Prop
  continuousPreference : Prop
  locallyNonSatiated : Prop
  strictMonotonic : Prop

structure UtilityPreferenceEvidence (U : UtilityPreferenceBridge) where
  representationPropertyClosed : U.representationProperty
  continuousPreferenceClosed : U.continuousPreference
  locallyNonSatiatedClosed : U.locallyNonSatiated
  strictMonotonicClosed : U.strictMonotonic

def UtilityPreferenceClosed (U : UtilityPreferenceBridge) : Prop :=
  U.representationProperty ∧ U.continuousPreference ∧
  U.locallyNonSatiated ∧ U.strictMonotonic

theorem utility_preference_closed_from_evidence (U : UtilityPreferenceBridge)
    (Ev : UtilityPreferenceEvidence U) : UtilityPreferenceClosed U := by
  exact And.intro Ev.representationPropertyClosed
    (And.intro Ev.continuousPreferenceClosed
      (And.intro Ev.locallyNonSatiatedClosed Ev.strictMonotonicClosed))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse