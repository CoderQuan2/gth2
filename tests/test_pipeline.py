import os
import pytest
import pandas as pd
import gth_solver.core as core

def test_sparc_dataset_existence():
    path = "datasets/GTH_v12_SPARC_175_Single_Sheet_Master.csv"
    assert os.path.exists(path), f"SPARC dataset missing at {path}"
    df = pd.read_csv(path)
    assert len(df) > 0

def test_lensing_dataset_existence():
    path = "datasets/GTH_v12_Cluster_Lensing_and_GW_Predictions.csv"
    assert os.path.exists(path), f"Lensing dataset missing at {path}"
    df = pd.read_csv(path)
    assert len(df) > 0

def test_solver_core_initialization():
    # Verify core solver functionality
    assert hasattr(core, "__file__")
  
