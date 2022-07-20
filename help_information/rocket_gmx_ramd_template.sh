#!/bin/bash
# example MPI+OpenMP job script for SLURM
#
# Tell SLURM which project's account to use:
#SBATCH -A abnffidp
#
#
# SLURM defaults to the directory you were working in when you submitted the job.
# Output files are also put in this directory. To set a different working directory add:
#
#
#SBATCH --mail-type=ALL
#SBATCH --mail-user=b8048283@ncl.ac.uk
# Tell SLURM if you want to be emailed when your job starts, ends, etc.
# Currently mail can only be sent to addresses @ncl.ac.uk
#
#
# This example has 4 MPI tasks, each with 22 cores
#
# number of tasks
#SBATCH  --ntasks=88
#SBATCH -t 48:00:00
#
#
# SLURM recommend using srun instead of mpirun for better job control.
gromacs2020-ramd-portable/bin/gmx_mpi mdrun   -deffnm md_ramd -cpi md_ramd.cpt -v  
