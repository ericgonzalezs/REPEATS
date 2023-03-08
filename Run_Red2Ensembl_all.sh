!/bin/bash
#SBATCH --account=def-rieseber
#SBATCH --time=2-0
#SBATCH --cpus-per-task=10
#SBATCH --mem=100G
#SBATCH --array=1-5
module load StdEnv/2020 python/3.10.2 bedtools/2.30.0

#modify the number of arrays depending on the number of files

i=$(cat FILES.txt | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)

name2=$(echo $i | cut -d "." -f 1) #adjust depending on the name of the file

source /home/egonza02/scratch/Restore20230217/SOFTWARE/plant-scripts/plant-scripts/Python_for_ENSMBL/bin/activate
#create a python environment to run red, I previously install all the python packages necessary to run red in this python environment
#pip install sqlalchemy
#pip install sqlalchemy_utils
# pip install pymysql

mkdir $name2

./Red2Ensembl.py --exe /home/egonza02/scratch/Restore20230217/SOFTWARE/plant-scripts/plant-scripts/lib/Red/bin/Red --cor 9 --msk_file "$name2""_Redmasked.fasta" --bed_file "$name2""_Redmaske
d.bed" $i $name2

deactivate

bedtools maskfasta  -fi $i -bed "$name2""_Redmasked.bed" -fo "$name2""_RedmaskedHM.fasta" #this is to create a hard masked file with the masked posstions from red
