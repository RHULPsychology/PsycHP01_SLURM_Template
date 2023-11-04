#!/bin/bash
# Script to submit jobs to the SLURM job scheduler on the cluster
# In this script we will submit a sample Python script to the job scheduler
# The sample Python script can be found at (https://github.com/RHULPsychology/PsycHP01_SLURM_Template/blob/main/sample_python_script.py)

# To be able to run a script properly through job scheduler SLURM and manage the input and output of the scripts
# SLURM requires 2 log files, one output log file saves/prints the Output of the script and the other error logfile saves/prints 
# the errors that the script might generate. hence we need to create a log folder for the scripts

# The following 3 lines of code Create log folder for output and error files. It creates the SLURM_log folder in 
# the users's home folder, the specific location is /home/<userid>/SLURM_log, where <usedid> is the local userid 
# If you need to have the output and error files to be saved in any other location, make sure to change the 
# OUTPUT_LOG_DIR=~/SLURM_log line of the code according to your requirement.

OUTPUT_LOG_DIR=~/SLURM_log
mkdir -p $OUTPUT_LOG_DIR
echo "created log folders successfully"



# The following line of code submits the Matlab script through the sbatch command. sbatch command configures the SLURM
# job scheduler to allocate the required memory and processing CPUs, time to run on the queue etc.
# In this example sbatch allocates 1 processing node, 1 CPU per task, the job is named as Sample_Python.job, 
# job_scheduler output file is Sample_Python_job.out and error file is Sample_Python_job.err under the OUTPUT_LOG_DIR created earlier.
# The maximum time this job can run on the scheduler will be 2 days and the memory allocated is 1000MB
# The last line 'python sample_python_script.py Captain_Spark' actually runs the sample_python_script.py file with the input 
# argument Captain_Spark

sbatch  --nodes=1 \
        --cpus-per-task=1 \
        --job-name=Sample_Python.job \
        --output=${OUTPUT_LOG_DIR}/Sample_Python_job.out \
        --error=${OUTPUT_LOG_DIR}/Sample_Python_job.err \
        --time=2-00:00 \
        --mem=1000 \
        python sample_python_script.py Captain_Spark
