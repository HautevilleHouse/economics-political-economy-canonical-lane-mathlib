import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure FirstWelfareTheoremPackage where
  economy : Type u
  competitiveEquilibrium : Type v
  paretoOptimalAllocation : Type w
  equilibriumParetoEfficient : Prop

structure FirstWelfareTheoremEvidence (F : FirstWelfareTheoremPackage) where
  equilibriumParetoEfficientClosed : F.equilibriumParetoEfficient

def FirstWelfareTheoremClosed (F : FirstWelfareTheoremPackage) : Prop :=
  F.equilibriumParetoEfficient

theorem first_welfare_theorem_closed_from_evidence
    (F : FirstWelfareTheoremPackage) (E : FirstWelfareTheoremEvidence F) :
    FirstWelfareTheoremClosed F := by
  exact E.equilibriumParetoEfficientClosed

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse