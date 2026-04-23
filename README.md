# QHA-calculation-PostProcessing
This script automates the post-processing of phonon calculations using phonopy and organizes the thermal data for further analysis (e.g., QHA).
This Bash script is designed to perform automated phonon post-processing for multiple displaced structures and collect thermal properties for quasi-harmonic approximation (QHA) analysis.

It first defines the working directory and the total number of displacements (poc=23). For each displacement folder, the script copies the required input files (mesh.conf and the corresponding POSCAR from SCF calculations), and then runs phonopy to generate force constants and compute thermal properties.

The script then systematically renames and transfers the generated thermal_properties.yaml files into a central qha directory using a custom indexing scheme centered around the reference structure (index 10). This ensures proper ordering of data for subsequent QHA analysis. Finally, it standardizes the naming of the central reference file.

🔧 What it does step-by-step
Loops over all displacement folders (1 → 23)
Copies necessary input files into each folder
Runs:
force constant extraction (phonopy --fc)
thermal property calculation (phonopy -t)
Renames output files based on displacement index
Moves all thermal data into a common qha directory
Ensures correct naming of the reference configuration
