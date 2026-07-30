import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure ProductionTechnology where
  capitalType : Type u
  laborType : Type v
  outputType : Type w
  productionFunction : capitalType -> laborType -> outputType
  constantReturnsToScale : Prop
  diminishingMarginalReturns : Prop
  inadaConditions : Prop

structure RamseyCassKoopmansEconomy (T : ProductionTechnology) where
  householdOptimization : Prop
  firmProfitMaximization : Prop
  marketClearing : Prop
  capitalAccumulationEquation : Prop
  eulerEquation : Prop
  transversalityCondition : Prop

structure RamseyCassKoopmansEvidence {T : ProductionTechnology}
    (E : RamseyCassKoopmansEconomy T) where
  householdOptimizationClosed : E.householdOptimization
  firmProfitMaximizationClosed : E.firmProfitMaximization
  marketClearingClosed : E.marketClearing
  capitalAccumulationEquationClosed : E.capitalAccumulationEquation
  eulerEquationClosed : E.eulerEquation
  transversalityConditionClosed : E.transversalityCondition

def RamseyCassKoopmansClosed {T : ProductionTechnology}
    (E : RamseyCassKoopmansEconomy T) : Prop :=
  E.householdOptimization ∧ E.firmProfitMaximization ∧
  E.marketClearing ∧ E.capitalAccumulationEquation ∧
  E.eulerEquation ∧ E.transversalityCondition

theorem ramsey_cass_koopmans_closed_from_evidence
    {T : ProductionTechnology} (E : RamseyCassKoopmansEconomy T)
    (Ev : RamseyCassKoopmansEvidence E) : RamseyCassKoopmansClosed E := by
  exact And.intro Ev.householdOptimizationClosed
    (And.intro Ev.firmProfitMaximizationClosed
      (And.intro Ev.marketClearingClosed
        (And.intro Ev.capitalAccumulationEquationClosed
          (And.intro Ev.eulerEquationClosed Ev.transversalityConditionClosed))))

end HautevilleHouse
end EconomicsPoliticalEconomyCanonicalLaneLean
