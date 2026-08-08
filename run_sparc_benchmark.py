#!/usr/bin/env python3
import os
import sys
from gth_solver import GTHPhysicsEngine
from gth_solver.sparc_benchmark import run_full_sparc_benchmark

def main():
    print("=================================================================")
    print("  GEOTOPOLOGICAL HYDRODYNAMICS (GTH v12.0) VERIFICATION CLI")
    print("=================================================================")
    engine = GTHPhysicsEngine(tuple_mode="macro")
    print(f" Locked G_eff:  {engine.tuple.G_eff:.4e} m^3/kg/s^2")
    print(f" Locked a_0:    {engine.tuple.a_0:.4e} m/s^2")
    print(f" Locked c_s:    {engine.tuple.c_s:.4e} m/s")
    print(f" Locked c_sub:  {engine.tuple.c_sub:.4e} m/s")
    print("-----------------------------------------------------------------")
    
    dataset_path = os.path.join(os.path.dirname(__file__), "datasets", "GTH_v12_SPARC_175_Single_Sheet_Master.csv")
    if os.path.exists(dataset_path):
        run_full_sparc_benchmark(dataset_path)
    else:
        print(f"Dataset not found at: {dataset_path}")

if __name__ == "__main__":
    main()
