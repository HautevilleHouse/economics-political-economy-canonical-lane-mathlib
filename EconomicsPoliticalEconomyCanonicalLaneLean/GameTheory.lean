import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

structure GameTheoryPackage where
  playerSet : Type u
  strategySpace : Type v
  payoffFunctions : Prop
  nashEquilibrium : Prop
  subgamePerfectEquilibrium : Prop
  bayesianNashEquilibrium : Prop
  evolutionaryStableStrategy : Prop

structure GameTheoryEvidence (G : GameTheoryPackage) where
  payoffFunctionsClosed : G.payoffFunctions
  nashEquilibriumClosed : G.nashEquilibrium
  subgamePerfectEquilibriumClosed : G.subgamePerfectEquilibrium
  bayesianNashEquilibriumClosed : G.bayesianNashEquilibrium
  evolutionaryStableStrategyClosed : G.evolutionaryStableStrategy

def GameTheoryClosed (G : GameTheoryPackage) : Prop :=
  G.payoffFunctions ∧ G.nashEquilibrium ∧
  G.subgamePerfectEquilibrium ∧ G.bayesianNashEquilibrium ∧
  G.evolutionaryStableStrategy

theorem game_theory_closed_from_evidence
    (G : GameTheoryPackage) (Ev : GameTheoryEvidence G) :
    GameTheoryClosed G := by
  exact And.intro Ev.payoffFunctionsClosed
    (And.intro Ev.nashEquilibriumClosed
      (And.intro Ev.subgamePerfectEquilibriumClosed
        (And.intro Ev.bayesianNashEquilibriumClosed Ev.evolutionaryStableStrategyClosed)))

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse