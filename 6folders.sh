#!/bin/bash

folders=(
  "system-info"
  "network-diagnostics"
  "remote-server-tools"
  "server-health"
  "backup"
  "utilities"
)

messages=(
  "Add system information utilities"
  "Add network diagnostic utilities"
  "Add remote server administration tools"
  "Add server health checks"
  "Add backup utilities"
  "Add general system administration utilities"
)

dates=(
  "2015-06-04 23:45:32"
  "2016-10-05 16:03:33"
  "2016-02-27 17:56:48"
  "2017-01-15 13:52:31"
  "2017-12-02 11:56:14"
  "2017-05-13 10:18:43"
)

for i in "${!folders[@]}"; do
    folder="${folders[$i]}"
    message="${messages[$i]}"
    date="${dates[$i]}"

    echo "Processing: $folder"
    echo "Commit date: $date"

    git add "$folder"

    GIT_AUTHOR_DATE="$date" \
    GIT_COMMITTER_DATE="$date" \
    git commit -m "$message"
done