#!/bin/bash
#SBATCH --account=def-rieseber
#SBATCH --time=7-0
#SBATCH --cpus-per-task=1
#SBATCH --mem=60G
#SBATCH --array=1-17
module load StdEnv/2020 r/4.1.2

# i=$(ls *.SNPpos.txt | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)

#name=$(echo $i | cut -d "." -f 1,2)

Rscript Plots_bed2.R VIGUIERA_H1_hap1_Redmasked.bed $SLURM_ARRAY_TASK_ID INV.txt

#INV.txt looks like this
#42307390        45432910        52161875        55769683        30      H2_HiC_scaffold_17      H1_HiC_scaffold_12      +
#56382209        66905054        28318036        38987856        30      H2_HiC_scaffold_17      H1_HiC_scaffold_12      +

#INV.txt could be all the *fp.txt table file from anchorwave
