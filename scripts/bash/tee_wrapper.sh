# !/bin/sh

echo "Current date:" `date`

PASSED=$1

if [[ -d $PASSED ]]; then
    echo "$PASSED is a directory"
    exit 1
elif [[ -f $PASSED ]]; then
    echo "Wrapped script: $1";
else
    echo "$PASSED is not valid"
    exit 1
fi

PASSED_BASENAME="$(basename -- $PASSED)"

# Split script output to stdout and to the logfile
exec 1> >(tee -a "$(pwd)/$PASSED_BASENAME.run.$(date +"%Y-%m-%dT%H_%M_%S%z").log")

$1 $2

# Empirical pause before exiting to wait for all output to get through the tee
sleep 1
exit 0