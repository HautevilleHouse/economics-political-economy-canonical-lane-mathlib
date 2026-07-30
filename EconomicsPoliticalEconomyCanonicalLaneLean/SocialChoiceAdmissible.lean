import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure SocialChoiceAdmissible where
  voters : Type
  alternatives : Type
  preferenceProfiles : voters → alternatives → alternatives → Prop
  socialWelfareFunction : (voters → alternatives → alternatives → Prop) → (alternatives → alternatives → Prop)
  unanimityCondition : Prop
  independenceOfIrrelevantAlternatives : Prop
  nonDictatorship : Prop
  arrowPossibility : Prop

structure SocialChoiceEvidence (S : SocialChoiceAdmissible) where
  unanimityConditionClosed : S.unanimityCondition
  independenceOfIrrelevantAlternativesClosed : S.independenceOfIrrelevantAlternatives
  nonDictatorshipClosed : S.nonDictatorship
  arrowPossibilityClosed : S.arrowPossibility

def SocialChoiceClosed (S : SocialChoiceAdmissible) : Prop :=
  S.unanimityCondition ∧ S.independenceOfIrrelevantAlternatives ∧
  S.nonDictatorship ∧ S.arrowPossibility

theorem social_choice_closed_from_evidence (S : SocialChoiceAdmissible)
    (Ev : SocialChoiceEvidence S) : SocialChoiceClosed S := by
  exact And.intro Ev.unanimityConditionClosed
    (And.intro Ev.independenceOfIrrelevantAlternativesClosed
      (And.intro Ev.nonDictatorshipClosed Ev.arrowPossibilityClosed))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse