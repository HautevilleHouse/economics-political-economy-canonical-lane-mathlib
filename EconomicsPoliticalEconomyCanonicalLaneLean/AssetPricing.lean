import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure AssetPricingPackage where
  stateSpace : Type u
  assetSpace : Type v
  stochasticDiscountFactor : Prop
  noArbitrage : Prop
  pricingKernel : Prop
  riskNeutralMeasure : Prop
  efficientMarketHypothesis : Prop

structure AssetPricingEvidence (A : AssetPricingPackage) where
  stochasticDiscountFactorClosed : A.stochasticDiscountFactor
  noArbitrageClosed : A.noArbitrage
  pricingKernelClosed : A.pricingKernel
  riskNeutralMeasureClosed : A.riskNeutralMeasure
  efficientMarketHypothesisClosed : A.efficientMarketHypothesis

def AssetPricingClosed (A : AssetPricingPackage) : Prop :=
  A.stochasticDiscountFactor ∧ A.noArbitrage ∧
  A.pricingKernel ∧ A.riskNeutralMeasure ∧
  A.efficientMarketHypothesis

theorem asset_pricing_closed_from_evidence
    (A : AssetPricingPackage) (Ev : AssetPricingEvidence A) :
    AssetPricingClosed A := by
  exact And.intro Ev.stochasticDiscountFactorClosed
    (And.intro Ev.noArbitrageClosed
      (And.intro Ev.pricingKernelClosed
        (And.intro Ev.riskNeutralMeasureClosed Ev.efficientMarketHypothesisClosed)))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse