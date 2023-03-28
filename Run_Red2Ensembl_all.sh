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

#I previously created a Python virtual environment called Python_for_ENSMBL like this
#virtualenv Python_for_ENSMBL
#then I activated the virtualenv and installed the next packages:
#pip install sqlalchemy
#pip install sqlalchemy_utils
#pip install pymysql
# And I closed the virtual env with the command deactivate

#I am activating again the virtualenv with the installed packages like this
source /home/egonza02/scratch/Restore20230217/SOFTWARE/plant-scripts/plant-scripts/Python_for_ENSMBL/bin/activate

mkdir $name2

./Red2Ensembl.py --exe /home/egonza02/scratch/Restore20230217/SOFTWARE/plant-scripts/plant-scripts/lib/Red/bin/Red --cor 9 --msk_file "$name2""_Redmasked.fasta" --bed_file "$name2""_Redmaske
d.bed" $i $name2

deactivate

bedtools maskfasta  -fi $i -bed "$name2""_Redmasked.bed" -fo "$name2""_RedmaskedHM.fasta" #this is to create a hard masked file with the masked posstions from red
