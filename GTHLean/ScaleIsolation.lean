import Lean
namespace GTH.ScaleIsolation
def ChiralOrthogonal (v1 v2 : Float) : Prop := v1 * v2 = 0.0
theorem orthogonal_decoupling (v1 v2 : Float) (h : ChiralOrthogonal v1 v2) : v1 * v2 = 0.0 := h
end GTH.ScaleIsolation
