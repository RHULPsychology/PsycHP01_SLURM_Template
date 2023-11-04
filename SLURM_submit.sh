#!/bin/bash
# Script to submit jobs to the SLURM job scheduler on the cluster
# In this script we will submit a sample Matlab script to the job scheduler
# The sample Matlab script can be found at 

# To be able to run a script properly through job scheduler SLURM and manage the input and output of the scripts
# SLURM requires 2 log files, one log file saves/prints the Output of the script and the other logfile saves/prints 
# the errors that the script might run into. hence we need to create a log folder for the scripts


OUTPUT_LOG_DIR=~/SLURM_log
mkdir -p $OUTPUT_LOG_DIR
echo "created log folders successfully"

# The above 3 lines of code Create log folder for output and error files. It creates the SLURM_log folder in 
# the users's home folder, the specific location is /home/<userid>/SLURM_log, where <usedid> is the local userid 
# If you need to have the output and error files to be saved in any other location, make sure to change the 
# OUTPUT_LOG_DIR=~/SLURM_log line of the code according to your requirement.

# The following line of code submits the Matlab script through the sbatch command. sbatch command configures the SLURM
# job scheduler to allocate the required memory and processing CPUs, time to run on the queue etc.

sbatch  --nodes=1 \
        --cpus-per-task=1 \
        --job-name=Sample_Matlab.job \
        --output=${OUTPUT_LOG_DIR}/Sample_Matlab_job.out \
        --error=${OUTPUT_LOG_DIR}/Sample_Matlab_job.err \
        --time=2-00:00 \
        --mem=12000 \
        --qos=normal \
        Rscript $HOME/project/LizardLips/run.R tomato potato shiabato
