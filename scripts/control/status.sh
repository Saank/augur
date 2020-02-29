#!/bin/bash
set -euo pipefail

echo "augur logs"
echo "*****************************"

tail logs/augur.log

echo
echo "*****************************"
echo "*****************************"
echo

for WORKER in $(ls -d workers/*/)
do
    if [[ $WORKER == *"_worker"* ]]; then

      # make it pretty for formatting
      FORMATTED_WORKER=${WORKER/#workers\//}
      FORMATTED_WORKER=${FORMATTED_WORKER/%\//}

      echo "$FORMATTED_WORKER"
      echo "*****************************"

      cd $WORKER
      tail *.log
      echo
      echo
      cd ../..

    fi
done