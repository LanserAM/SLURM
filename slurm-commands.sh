#!/bin/bash

###
### SLURM commands begin with a single comment character (#)
###
### To test these commands out, remove the single comment character (#)
### at the beginning of the line (some commands use placeholders that
### should be replaced in order for the command to run) and type: 
###
### bash slurm-commands.sh 
###

### Typing "squeue" will display the queue of jobs, including those 
### jobs that are running or blocked
#squeue 
#squeue --states=running
#squeue --long
#squeue --start
#squeue --format="%10u %15a %5i %2t %4M %5D %9C %10f %10n %o %Z"

### "sacct" accesses the database of job information and shows
### info for jobs that have already run. By default, sacct will
### display info about your own jobs run on the current day.
#sacct
#sacct --starttime=01.01.15    ### all jobs since Jan 15, 2015
#sacct --allusers
#sacct --format=User,JobID,account,Timelimit,elapsed,ReqMem,MaxRss,MaxVMSize,nnodes,ncpus,nodelist,ExitCode
#sacct --format=User,JobID,account,nodelist,Submit,Start,End,Elapsed,Timelimit

### "scontrol" provides options for modifying resource requests for submitted jobs
### It also provides a means of checking node attributes. Note, commands with JOBID
### will not work as-is, they need actual job ids that you own in order to work.
#scontrol show nodes
#scontrol hold JOBID
#scontrol release JOBID
#scontrol update JobID=JOBID Timelimit=1-12:00:00

### "sinfo" shows you information about SLURM nodes and partitions.
#sinfo
#sinfo --Nel   #### node-oriented format
#sinfo --states=IDLE    ### list of idle nodes
#sinfo --states=down,drain,fail,no_respond,maint,unk --format="%12n %10T %20f %20H %12u %32E"  ### list of problematic nodes
#sinfo --format="%70N %.25f %.10a %.10A"   ### shows features associated with nodes

### "sreport" generates reports of job usage and cluster utilization.
### By default, this provides information about the current day only.
### Note that this command can take a long time to complete depending 
### on how far back in time you want to go.
#sreport cluster utilization
#sreport user top  ### shows top ten cluster users
#sreport cluster AcountUtilizationByUser start=2015-01-01 -t Hours  ### splits job usage (CPU hours) by group and user
#sreport job sizesbyaccount PrintJobCount  ### shows number of jobs run by user

### "sbatch" submits a SLURM job batch script. Note that this command
### will not work as-is, you will need to provide your own batch script.
#sbatch script.slurm

### "salloc" obtains a SLURM job allocation, executes a command,
### and then releases the allocation when the job completes. This
### can be used for running interative jobs
#salloc --ntasks=1 --time=1:00:00 srun --pty /bin/bash    ### 1 CPU core allocation
#salloc --nodes=2 --ntasks=16 --time=2:00:00 srun --pty /bin/bash    ### 16 CPU core allocation

### "scancel" is the command for canceling a job that is either queued or running.
### You will need to supply the appropriate SLURM JobID here.
#scancel JOBID
