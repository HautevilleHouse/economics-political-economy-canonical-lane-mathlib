import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure ExpectedUtilityPreferences where
  outcomes : Type u
  lotteries : Type v
  preferenceRelation : lotteries → lotteries → Prop
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  independence : Prop
  expectedUtilityRepresentationExists : Prop

structure ExpectedUtilityEvidence (P : ExpectedUtilityPreferences) where
  completenessClosed : P.completeness
  transitivityClosed : P.transitivity
  continuityClosed : P.continuity
  independenceClosed : P.independence
  representationClosed : P.expectedUtilityRepresentationExists

def ExpectedUtilityClosed (P : ExpectedUtilityPreferences) : Prop :=
  P.completeness ∧ P.transitivity ∧ P.continuity ∧ P.independence ∧ P.expectedUtilityRepresentationExists

theorem expected_utility_closed_from_evidence (P : ExpectedUtilityPreferences) (Ev : ExpectedUtilityEvidence P) :
    ExpectedUtilityClosed P := by
  exact And.intro Ev.completenessClosed
    (And.intro Ev.transitivityClosed
      (And.intro Ev.continuityClosed
        (And.intro Ev.independenceClosed Ev.representationClosed)))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse