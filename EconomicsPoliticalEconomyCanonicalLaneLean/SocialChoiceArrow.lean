import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure SocialChoiceFunction where
  alternatives : Type u
  voters : Type v
  preferences : voters → alternatives → alternatives → Prop
  aggregationRule : (voters → alternatives → alternatives → Prop) → alternatives → alternatives → Prop
  paretoEfficiency : Prop
  independenceOfIrrelevantAlternatives : Prop
  nonDictatorship : Prop
  arrowTheoremConclusion : Prop

structure SocialChoiceEvidence (S : SocialChoiceFunction) where
  paretoEfficiencyClosed : S.paretoEfficiency
  iiaClosed : S.independenceOfIrrelevantAlternatives
  nonDictatorshipClosed : S.nonDictatorship
  arrowConclusionClosed : S.arrowTheoremConclusion

def SocialChoiceClosed (S : SocialChoiceFunction) : Prop :=
  S.paretoEfficiency ∧ S.independenceOfIrrelevantAlternatives ∧ S.nonDictatorship ∧ S.arrowTheoremConclusion

theorem social_choice_closed_from_evidence (S : SocialChoiceFunction) (Ev : SocialChoiceEvidence S) :
    SocialChoiceClosed S := by
  exact And.intro Ev.paretoEfficiencyClosed
    (And.intro Ev.iiaClosed
      (And.intro Ev.nonDictatorshipClosed Ev.arrowConclusionClosed))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse