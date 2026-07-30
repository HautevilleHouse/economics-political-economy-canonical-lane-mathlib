import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure ArrowDebreuCommoditySpace where
  commodityTypes : Type u
  priceSystem : Type v
  endowments : Type w
  preferences : Type z
  initialEndowmentAllocation : Prop
  preferenceContinuity : Prop
  preferenceConvexity : Prop
  localNonSatiation : Prop
  positivityOfPrices : Prop

structure ArrowDebreuEquilibrium (C : ArrowDebreuCommoditySpace) where
  priceVector : C.priceSystem
  consumptionPlan : C.endowments -> C.commodityTypes
  marketClearing : Prop
  utilityMaximization : Prop
  profitMaximization : Prop
  feasibility : Prop
  walrasLaw : Prop

structure ArrowDebreuEquilibriumEvidence {C : ArrowDebreuCommoditySpace}
    (E : ArrowDebreuEquilibrium C) where
  marketClearingClosed : E.marketClearing
  utilityMaximizationClosed : E.utilityMaximization
  profitMaximizationClosed : E.profitMaximization
  feasibilityClosed : E.feasibility
  walrasLawClosed : E.walrasLaw

def ArrowDebreuEquilibriumClosed {C : ArrowDebreuCommoditySpace}
    (E : ArrowDebreuEquilibrium C) : Prop :=
  E.marketClearing ∧ E.utilityMaximization ∧
  E.profitMaximization ∧ E.feasibility ∧ E.walrasLaw

theorem arrow_debreu_equilibrium_closed_from_evidence
    {C : ArrowDebreuCommoditySpace} (E : ArrowDebreuEquilibrium C)
    (Ev : ArrowDebreuEquilibriumEvidence E) : ArrowDebreuEquilibriumClosed E := by
  exact And.intro Ev.marketClearingClosed
    (And.intro Ev.utilityMaximizationClosed
      (And.intro Ev.profitMaximizationClosed
        (And.intro Ev.feasibilityClosed Ev.walrasLawClosed)))

end HautevilleHouse
end EconomicsPoliticalEconomyCanonicalLaneLean
