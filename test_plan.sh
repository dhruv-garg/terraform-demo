#!/bin/bash
output=`terraform plan`
echo $output
sub="No changes"
if [[ "$output" == *"$sub"* ]]; then
	echo "No changes to terraform infrastructure"
else
	echo "Drift in terraform infrastructure"
	exit 1
fi
