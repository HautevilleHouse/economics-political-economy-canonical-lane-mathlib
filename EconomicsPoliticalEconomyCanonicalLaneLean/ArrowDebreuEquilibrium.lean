import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure ArrowDebreuEconomy where
  commodities : Type u
  consumers : Type v
  endowments : consumers → commodities → ℝ
  preferences : consumers → (commodities → ℝ) → Prop
  productionSets : Type w
  profitMaximization : Prop
  utilityMaximization : Prop
  marketClearing : Prop
  priceSystem : commodities → ℝ
  equilibriumExists : Prop

structure ArrowDebreuEvidence (E : ArrowDebreuEconomy) where
  utilityMaximizationClosed : E.utilityMaximization
  profitMaximizationClosed : E.profitMaximization
  marketClearingClosed : E.marketClearing
  equilibriumExistsClosed : E.equilibriumExists

def ArrowDebreuClosed (E : ArrowDebreuEconomy) : Prop :=
  E.utilityMaximization ∧ E.profitMaximization ∧ E.marketClearing ∧ E.equilibriumExists

theorem arrow_debreu_closed_from_evidence (E : ArrowDebreuEconomy) (Ev : ArrowDebreuEvidence E) :
    ArrowDebreuClosed E := by
  exact And.intro Ev.utilityMaximizationClosed
    (And.intro Ev.profitMaximizationClosed
      (And.intro Ev.marketClearingClosed Ev.equilibriumExistsClosed))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse