import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic.Positivity

/-
  Geotopological Hydrodynamics (GTH v12.0)
  Lean 4 Formal Proof Scripts for the 6 Algebraic Closure Gates
-/

structure ConstitutiveTuple where
  M_UV : ℝ
  m_IR : ℝ
  rho_0 : ℝ
  K : ℝ
  G_shear : ℝ
  tau_0 : ℝ
  eta_n : ℝ

def IsAdmissible (θ : ConstitutiveTuple) : Prop :=
  θ.M_UV > 0 ∧ θ.m_IR > 0 ∧ θ.rho_0 > 0 ∧ θ.K > 0 ∧ θ.G_shear > 0 ∧ θ.tau_0 > 0 ∧ θ.eta_n > 0

theorem Gate1_G_eff_positive (θ : ConstitutiveTuple) (h : IsAdmissible θ) :
    (3 * Real.pi * 1.054571817e-34 * Real.sqrt (θ.K / θ.rho_0)) / (4 * θ.M_UV^2) > 0 := by
  rcases h with ⟨hM, -, hrho, hK, -, -, -⟩
  have h_ratio : θ.K / θ.rho_0 > 0 := div_pos hK hrho
  have h_sqrt : Real.sqrt (θ.K / θ.rho_0) > 0 := Real.sqrt_pos.mpr h_ratio
  have h_num : 3 * Real.pi * 1.054571817e-34 * Real.sqrt (θ.K / θ.rho_0) > 0 := by
    positivity
  have h_den : 4 * θ.M_UV^2 > 0 := by
    positivity
  exact div_pos h_num h_den

theorem Gate2_a0_positive (θ : ConstitutiveTuple) (h : IsAdmissible θ) :
    Real.sqrt ((θ.K * θ.G_shear) / (θ.rho_0 * θ.tau_0^2 * θ.eta_n)) > 0 := by
  rcases h with ⟨-, -, hrho, hK, hG, htau, heta⟩
  have h_num : θ.K * θ.G_shear > 0 := mul_pos hK hG
  have h_den : θ.rho_0 * θ.tau_0^2 * θ.eta_n > 0 := by
    positivity
  have h_ratio : (θ.K * θ.G_shear) / (θ.rho_0 * θ.tau_0^2 * θ.eta_n) > 0 := div_pos h_num h_den
  exact Real.sqrt_pos.mpr h_ratio
