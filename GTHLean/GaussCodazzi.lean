import Lean
namespace GTH.GaussCodazzi
structure ZeroModeProjection where
  dimIn : Nat := 5
  dimOut : Nat := 4
  validProjection : dimIn = dimOut + 1 := by rfl
end GTH.GaussCodazzi
