Here we show you how to use the -resume feature for when you need to re-launch the same workflow, how to inspect the log of past executions with nextflow log, and how to delete older work directories with nextflow clean.

#Re-launch a workflow with -resume
nextflow run hello-world.nf -resume

#Inspect the log of past executions
nextflow log

#Delete older work directories
#There are multiple options (https://www.nextflow.io/docs/latest/reference/cli.html#clean) to determine what to delete.
#Here we show you an example that deletes all subdirectories from runs before a given run, specified using its run name.
#First we use the dry run flag -n to check what will be deleted given the command:
nextflow clean -before golden_cantor -n

#Proceed with deletion
nextflow clean -before golden_cantor -f
