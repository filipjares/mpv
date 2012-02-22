#!/bin/bash

path="../src/"
files="affine affinetr dgauss gauss gaussderiv gaussderiv2 gaussfilter"
suffix=".m"
list="";

for name in $files; do
	list="$list ${path}${name}${suffix}";
done;

echo zip -j for_upload.zip $list
zip -j for_upload.zip $list
