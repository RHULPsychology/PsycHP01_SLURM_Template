#!/bin/bash
# Script to submit jobs to the SLURM job scheduler on the cluster

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


echo "Processing script $script_file on database $database_file"

qsub    -l h_rss=8G \
        -o ${OUTPUT_LOG_DIR}/R_${database_file}.out \
        -e ${OUTPUT_LOG_DIR}/R_${database_file}.err \
        bash $script_folder/call_R_Script.sh $script_folder $script_file $database_file;
