# Gromacs_RAMD_portable_package

Attached is the package, as long as you unzip it, you can just use it like the general gromacs. There is a folder named "help_information" which includes:
step_by_step.dat: which has a detailed process about how to use it run RAMD
rocket_gmx_ramd_template.sh: is the submiting file in rocket.hpc
gromacs_ramd.mdp: a template mdp file for RAMD product.
Also there is a folder named "RAMD_test", include one complex which already dissociated, so if you run $path_of_package/bin/gmx_mpi mdrun -deffnm md_ramd -v , you can easily have a taste about RAMD simulation.

Basiclly NAMD and Gromacs have similar accurate in running RAMD, and based on Daria B. Kokh's comment, for both NAMD and Gromacs "with sufficient sampling, the computed egress routes and ligand residence times agree within numerical error. The implementation of RAMD in GROMACS provides better computing performance with better scalability than the implementation in NAMD. This difference arises because the random force is implemented inside the MD code in GROMACS rather than in a tcl script as for NAMD"
