import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure UtilityPreferenceRepresentationPackage where
  consumptionSet : Type u
  preferenceRelation : Type v
  utilityFunction : Type w
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  utilityRepresentsPreferences : Prop

structure UtilityPreferenceRepresentationEvidence (U : UtilityPreferenceRepresentationPackage) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity
  utilityRepresentsPreferencesClosed : U.utilityRepresentsPreferences

def UtilityPreferenceRepresentationClosed (U : UtilityPreferenceRepresentationPackage) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.continuity ∧ U.utilityRepresentsPreferences

theorem utility_preference_representation_closed_from_evidence
    (U : UtilityPreferenceRepresentationPackage)
    (E : UtilityPreferenceRepresentationEvidence U) :
    UtilityPreferenceRepresentationClosed U := by
  exact And.intro E.completenessClosed
    (And.intro E.transitivityClosed
      (And.intro E.continuityClosed E.utilityRepresentsPreferencesClosed))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse