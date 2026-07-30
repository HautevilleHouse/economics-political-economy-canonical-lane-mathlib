import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure CAPMAssetPricing where
  riskFreeRate : ℝ
  expectedMarketReturn : ℝ
  beta : ℝ
  expectedReturn : ℝ
  marketPortfolio : Type u
  efficientFrontier : Prop
  securityMarketLine : Prop
  equilibriumPricing : Prop

structure CAPMEvidence (C : CAPMAssetPricing) where
  efficientFrontierClosed : C.efficientFrontier
  securityMarketLineClosed : C.securityMarketLine
  equilibriumPricingClosed : C.equilibriumPricing

def CAPMClosed (C : CAPMAssetPricing) : Prop :=
  C.efficientFrontier ∧ C.securityMarketLine ∧ C.equilibriumPricing

theorem capm_closed_from_evidence (C : CAPMAssetPricing) (Ev : CAPMEvidence C) :
    CAPMClosed C := by
  exact And.intro Ev.efficientFrontierClosed
    (And.intro Ev.securityMarketLineClosed Ev.equilibriumPricingClosed)

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse