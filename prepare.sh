#!/bin/bash
P=`pwd`

# Number of displacements
poc=23

for i in `seq 1 $poc`
do
  cd $P
  cp mesh.conf $i
  cp ../SCF/$i/POSCAR $i/POSCAR-unitcell
  cd "$i"
  phonopy --fc vasprun.xml
  phonopy --dim="2 2 1" -c POSCAR-unitcell -t mesh.conf

# Calculate the destination file index
  if [ $i -le 10 ]; then
    dest_index=$((10 - i))
    dest_file="thermal_properties.yaml--$dest_index"
  else
    dest_index=$((i - 10))
    dest_file="thermal_properties.yaml-$dest_index"
  fi

  # Copy the thermal_properties.yaml to the target destination with the correct naming
  cp thermal_properties.yaml "../../qha/$dest_file"

  echo "Copied $i/thermal_properties.yaml to ../../qha/$dest_file"
  mv qha/thermal_properties.yaml--0 thermal_properties.yaml-0
done
