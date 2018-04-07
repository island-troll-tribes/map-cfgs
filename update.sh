#!/bin/bash

set -e

version="${1?Need version}"
category=$2
configs=${3:-'ranked.cfg unranked.cfg obs.cfg refs.cfg 6v6.cfg 1v1league.cfg tournament.cfg'}

for cfg in $configs; do
	if [ -f $cfg ]; then
		echo updating $cfg...
		sed -i -e "s/v[^ ]*.w3x/v$version.w3x/g" $cfg
		if [ ! -z "$category" ]; then
			echo updating category to $category
			sed -i -e "s/^map_statsw3mmdcategory = .*$/map_statsw3mmdcategory = $category/g" $cfg
		fi
	else
		echo $config not found!
		continue
	fi
done
