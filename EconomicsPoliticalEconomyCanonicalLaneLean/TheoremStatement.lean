import HautevilleHouse.EconomicsPoliticalEconomyCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure EconomicsPoliticalEconomyTheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  manifoldConstrainedStatement : Prop
  carriedRemainder : String

def economicsPoliticalEconomyTheoremStatement : EconomicsPoliticalEconomyTheoremStatement :=
  { sourceKey := "EconomicsPoliticalEconomy"
  , theoremName := "ArrowDebreuEquilibrium"
  , theoremObject := "Arrow-Debreu equilibrium existence"
  , manifoldConstrainedStatement := ∀ (A : AdmissibleClass), ConstrainedEconomicsPoliticalEconomyClosure A
  , carriedRemainder := "External to this package"
  }

theorem theorem_statement_proven : economicsPoliticalEconomyTheoremStatement.manifoldConstrainedStatement := by
  intro A
  exact constrained_economics_political_economy_endgame A

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse