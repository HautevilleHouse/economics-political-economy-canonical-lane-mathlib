import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure GrowthModel where
  capitalStock : Type
  laborSupply : Type
  productionFunction : capitalStock → laborSupply → ℝ
  savingRate : ℝ
  depreciationRate : ℝ
  steadyStateCapital : capitalStock
  balancedGrowthPath : Prop
  stabilityUnderShocks : Prop

structure GrowthModelEvidence (G : GrowthModel) where
  balancedGrowthPathClosed : G.balancedGrowthPath
  stabilityUnderShocksClosed : G.stabilityUnderShocks

def GrowthModelClosed (G : GrowthModel) : Prop :=
  G.balancedGrowthPath ∧ G.stabilityUnderShocks

theorem growth_model_closed_from_evidence (G : GrowthModel)
    (Ev : GrowthModelEvidence G) : GrowthModelClosed G := by
  exact And.intro Ev.balancedGrowthPathClosed Ev.stabilityUnderShocksClosed

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse