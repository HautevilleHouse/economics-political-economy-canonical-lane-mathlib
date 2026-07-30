import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure SolowGrowthModelPackage where
  productionFunction : Type u
  capitalAccumulation : Type v
  savingsRate : Prop
  depreciationRate : Prop
  steadyStateExists : Prop
  steadyStateStable : Prop

structure SolowGrowthModelEvidence (S : SolowGrowthModelPackage) where
  savingsRateClosed : S.savingsRate
  depreciationRateClosed : S.depreciationRate
  steadyStateExistsClosed : S.steadyStateExists
  steadyStateStableClosed : S.steadyStateStable

def SolowGrowthModelClosed (S : SolowGrowthModelPackage) : Prop :=
  S.savingsRate ∧ S.depreciationRate ∧ S.steadyStateExists ∧ S.steadyStateStable

theorem solow_growth_model_closed_from_evidence
    (S : SolowGrowthModelPackage) (E : SolowGrowthModelEvidence S) :
    SolowGrowthModelClosed S := by
  exact And.intro E.savingsRateClosed
    (And.intro E.depreciationRateClosed
      (And.intro E.steadyStateExistsClosed E.steadyStateStableClosed))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse