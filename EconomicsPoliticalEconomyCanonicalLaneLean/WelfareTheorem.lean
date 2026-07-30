import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure WelfareTheoremPackage where
  economyAgents : Type u
  endowmentVector : economyAgents → ℕ
  initialAllocation : economyAgents → ℕ
  competitiveEquilibrium : Prop
  paretoEfficiency : Prop
  firstWelfareTheorem : Prop
  secondWelfareTheorem : Prop

structure WelfareTheoremEvidence (W : WelfareTheoremPackage) where
  competitiveEquilibriumClosed : W.competitiveEquilibrium
  paretoEfficiencyClosed : W.paretoEfficiency
  firstWelfareTheoremClosed : W.firstWelfareTheorem
  secondWelfareTheoremClosed : W.secondWelfareTheorem

def WelfareTheoremClosed (W : WelfareTheoremPackage) : Prop :=
  W.competitiveEquilibrium ∧ W.paretoEfficiency ∧ W.firstWelfareTheorem ∧ W.secondWelfareTheorem

theorem welfare_theorem_closed_from_evidence (W : WelfareTheoremPackage)
    (Ev : WelfareTheoremEvidence W) : WelfareTheoremClosed W := by
  exact And.intro Ev.competitiveEquilibriumClosed
    (And.intro Ev.paretoEfficiencyClosed
      (And.intro Ev.firstWelfareTheoremClosed Ev.secondWelfareTheoremClosed))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse