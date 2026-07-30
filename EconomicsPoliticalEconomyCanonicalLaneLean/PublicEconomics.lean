import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure PublicEconomicsPackage where
  publicGoods : Prop
  externalities : Prop
  taxationPolicy : Prop
  redistributionMechanism : Prop
  welfareFunction : Prop
  socialChoiceRule : Prop

structure PublicEconomicsEvidence (P : PublicEconomicsPackage) where
  publicGoodsClosed : P.publicGoods
  externalitiesClosed : P.externalities
  taxationPolicyClosed : P.taxationPolicy
  redistributionMechanismClosed : P.redistributionMechanism
  welfareFunctionClosed : P.welfareFunction
  socialChoiceRuleClosed : P.socialChoiceRule

def PublicEconomicsClosed (P : PublicEconomicsPackage) : Prop :=
  P.publicGoods ∧ P.externalities ∧
  P.taxationPolicy ∧ P.redistributionMechanism ∧
  P.welfareFunction ∧ P.socialChoiceRule

theorem public_economics_closed_from_evidence
    (P : PublicEconomicsPackage) (Ev : PublicEconomicsEvidence P) :
    PublicEconomicsClosed P := by
  exact And.intro Ev.publicGoodsClosed
    (And.intro Ev.externalitiesClosed
      (And.intro Ev.taxationPolicyClosed
        (And.intro Ev.redistributionMechanismClosed
          (And.intro Ev.welfareFunctionClosed Ev.socialChoiceRuleClosed))))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse