# squeue-helper
Set of functions and autocompletion methods for working with slurm.


# Setup
Versions for either bash or zsh are available, the scripts just need to be sourced. 

```bash
source _squeue_helper.bash
OR
source _squeue_helper.zsh
```

Both version provide a set of functions, zsh just giving better autocompletion UI.

----

#### q:
`q` is a wrapper around `squeue` with a sensible default output format and greys out pending jobs.


#### qcd:
`qcd` is a wrapper around `cd` with added autocompletion for the user's jobs. 


#### jcd:
`jcd` will cd you to the directory whose job ID is given as argument. Just like `qcd` autocompletion will suggest your jobs currently in queue (running or not).


#### scancel:
The script also adds job ID autocompletion to slurm `scancel` command.
