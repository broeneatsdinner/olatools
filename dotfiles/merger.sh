awk 'NR == 1 || $0 !~ /^#!\/usr\/bin\/env bash/' .bash_1_initialization .bash_aliases .bash_functions .bash_profile .best_bash_history > bash_combined
