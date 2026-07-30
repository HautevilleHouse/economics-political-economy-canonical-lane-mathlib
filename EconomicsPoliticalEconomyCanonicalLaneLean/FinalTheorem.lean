import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPoliticalEconomyCanonicalLaneLean

def ConstrainedEconomicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_economics_endgame (A : AdmissibleClass) :
    ConstrainedEconomicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EconomicsPoliticalEconomyCanonicalLaneLean
end HautevilleHouse