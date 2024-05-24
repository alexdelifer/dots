# enable all modules if running check for find-old
if [ $aconfmgr_action == "check" ]; then
    echo "::: config: CHECK: $(tput setaf 3)$(tput bold)ENABLING ALL MODULES FOR CHECK$(tput sgr0)"
    ALL_MODULES=$(ls ${config_dir}/*.sh | cut -d'-' -f 2 | cut -d. -f1)
    MODULES=$ALL_MODULES
fi