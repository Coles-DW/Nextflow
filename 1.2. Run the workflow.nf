#cd to the working directory
cd hello-nextflow

#Launch the workflow and monitor execution
nextflow run hello-world.nf

#info about ouput logs
.command.begin: Metadata related to the beginning of the execution of the process call
.command.err: Error messages (stderr) emitted by the process call
.command.log: Complete log output emitted by the process call
.command.out: Regular output (stdout) by the process call
.command.run: Full script run by Nextflow to execute the process call
.command.sh: The command that was actually run by the process call
.exitcode: The exit code resulting from the command

