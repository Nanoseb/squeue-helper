# squeue-helper
Set of functions and autocompletion methods for working with slurm


# Setup
Versions for either bash or zsh are available, the scripts just need to be sourced. 

```bash
source _squeue_helper.bash
OR
source _squeue_helper.zsh
```

Both version provide a set of functions, zsh just giving better autocompletion UI.

### q
`q` function is a wrapper around `squeue` with some default output format and greys out pending jobs.


### qcd
`qcd` is a wrapper around `cd` but with autocompletion for the user's jobs. 


### jcd
`jcd` will cd you to the directory whose job ID is given as argument, just like `qcd` autocompletion will suggests your currently in queue (running or not) jobs.


### scancel
The scripts also adds job ID autocompletion to `scancel` command.
