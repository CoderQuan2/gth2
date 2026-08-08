from setuptools import setup, find_packages

setup(
    name="gth_solver",
    version="12.0.0",
    author="Taquan A. Abram",
    packages=find_packages(),
    install_requires=["numpy>=1.26.0", "scipy>=1.12.0", "matplotlib>=3.8.0"],
    python_requires=">=3.10",
)
