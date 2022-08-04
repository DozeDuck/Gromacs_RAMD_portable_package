#!/bin/bash
# Usage: ./generate_ramd_mdp.sh <number_of_ramd_replicas> <number_of_ramd_forces> <name_of_ligand_in_index>
### e.g: ./generate_ramd_mdp.sh 15 200 MOL
###
### generate_ramd_mdp.sh - generate the gromacs_ramd.mdp files
###
### Usage:
###      generate_ramd_mdp.sh <number_of_ramd_replicas> <number_of_ramd_forces> <name_of_ligand_in_index>
###
### Options:
###     <number_of_ramd_replicas>		The gro file generated from gmx pdb2gmx
###     <number_of_ramd_forces>		The gro file generated from acpype
###     <name_of_ligand_in_index>		The name of ligand which showed in the index.ndx
###     -h					Show this message

help() {
	sed -rn 's/^### ?//;T;p;' "$0"
}

if [[ $# == 0 ]]  || [[ "$1" == "-h" ]]; then
	help
	exit 1
fi


echo "integrator               = md
comm-mode                = Linear
nstcomm                  = 100
comm_grps                = System
tinit                    = 0.000
dt                       = 0.002
nsteps                   = 20000000
nstxout                  = 5000
nstvout                  = 5000
nstlog                   = 5000
nstenergy                = 5000
nstxtcout                = 5000
nstfout 	 	 = 5000
compressed-x-precision   = 1000
xtc_grps                 = SYSTEM
pbc                      = xyz
rlist                    = 1.10
coulombtype              = PME
cutoff-scheme            = Verlet
fourierspacing           = 0.12
pme_order                = 4
ewald_geometry           = 3d
ewald-rtol               = 1e-5
ewald-rtol-lj            = 1e-5
optimize_fft             = yes
vdw-type                 = Cut-off
vdw-modifier             = Potential-shift
rvdw-switch              = 0.0
rvdw                     = 1.00
tcoupl                   =  Nose-Hoover
tc_grps                  = Protein_INH Water_and_ions
tau_t                    = 1.0 1.0
ref_t                    = 300 300
Pcoupl                   = Parrinello-Rahman
pcoupltype               = isotropic
tau_p                    = 2
compressibility          = 4.5e-5
ref_p                    = 1
gen_vel                  = no
continuation = no
constraints              = h-bonds
constraint_algorithm     = lincs
lincs_order              = 4
lincs_iter               = 1
lincs_warnangle          = 60
DispCorr                 = EnerPres


ramd                     = yes
ramd-seed                = 98XX
ramd-ngroups             = 1
ramd-group1-receptor     = Protein
ramd-group1-ligand       = INH
ramd-group1-force        = 585 ; = 14kcal/mol A
ramd-group1-r-min-dist   = 0.0025
ramd-group1-max-dist     = 4.0
ramd-eval-freq           = 50
ramd-force-out-freq      = 10
ramd-pbc-ref-prev-step-com   = yes
ramd-group1-ligand-pbcatom   = 3285
ramd-group1-receptor-pbcatom = 1631" > ramd_template.mdp

for i in `seq 1 $1`
do
	cp ramd_template.mdp ramd_$i.mdp 
	sed -i "s/98XX/98$i/g" ramd_$i.mdp
	sed -i "s/585/$2/g" ramd_$i.mdp
	sed -i "s/INH/$3/g" ramd_$i.mdp
done


