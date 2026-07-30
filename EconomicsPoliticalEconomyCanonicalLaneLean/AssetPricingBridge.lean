import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure AssetPricingBridge where
  stateSpace : Type
  assetPayoffs : stateSpace → ℝ
  priceVector : ℝ
  discountFactor : ℝ
  riskNeutralProbability : stateSpace → ℝ
  noArbitrageCondition : Prop
  lawOfOnePrice : Prop
  martingaleProperty : Prop

structure AssetPricingEvidence (A : AssetPricingBridge) where
  noArbitrageConditionClosed : A.noArbitrageCondition
  lawOfOnePriceClosed : A.lawOfOnePrice
  martingalePropertyClosed : A.martingaleProperty

def AssetPricingClosed (A : AssetPricingBridge) : Prop :=
  A.noArbitrageCondition ∧ A.lawOfOnePrice ∧ A.martingaleProperty

theorem asset_pricing_closed_from_evidence (A : AssetPricingBridge)
    (Ev : AssetPricingEvidence A) : AssetPricingClosed A := by
  exact And.intro Ev.noArbitrageConditionClosed
    (And.intro Ev.lawOfOnePriceClosed Ev.martingalePropertyClosed)

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse