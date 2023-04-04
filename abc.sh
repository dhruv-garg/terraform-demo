#!/bin/bash
output=`terraform plan`
echo $output
sub="No changes"
if [[ "$output" == *"$sub"* ]]; then
	echo "Woahh"
fi
