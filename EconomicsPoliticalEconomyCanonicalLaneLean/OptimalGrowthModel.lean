import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure OptimalGrowthModel where
  productionFunction : ℝ → ℝ
  utilityFunction : ℝ → ℝ
  discountFactor : ℝ
  initialCapital : ℝ
  resourceConstraint : Prop
  eulerEquation : Prop
  transversalityCondition : Prop
  optimalConsumptionPath : Type u

structure OptimalGrowthEvidence (M : OptimalGrowthModel) where
  resourceConstraintClosed : M.resourceConstraint
  eulerEquationClosed : M.eulerEquation
  transversalityConditionClosed : M.transversalityCondition

def OptimalGrowthClosed (M : OptimalGrowthModel) : Prop :=
  M.resourceConstraint ∧ M.eulerEquation ∧ M.transversalityCondition

theorem optimal_growth_closed_from_evidence (M : OptimalGrowthModel) (Ev : OptimalGrowthEvidence M) :
    OptimalGrowthClosed M := by
  exact And.intro Ev.resourceConstraintClosed
    (And.intro Ev.eulerEquationClosed Ev.transversalityConditionClosed)

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse