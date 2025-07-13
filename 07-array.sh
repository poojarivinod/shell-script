#!/bin/bash
MOVIES=("pushpa" "rrr" "devara")
#index start from 0, size is 3

echo "First movie:: ${MOVIES[0]}"
echo "second movie:: ${MOVIES[1]}"
echo "third movie:: ${MOVIES[2]}"

echo "All the movies are:: ${MOVIES[@]}"