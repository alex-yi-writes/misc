#!/bin/bash
f_src=/mnt/work/yyi/temp/ED_coreg/LIDO
f_dest=/mnt/work/yyi/temp/ED_coreg/falk

# MNI
MNI=/mnt/work/yyi/temp/ED_coreg/mni_icbm152_t1_tal_nlin_asym_09c.nii
template=/mnt/work/yyi/temp/ED_coreg/hc_template.nii.gz

ls -d ${f_src}/*/ > ${f_src}/LIDO.txt

while read folder; do
  ID=$(echo "${folder}" | grep -o -E '[0-9][0-9][0-9]')
  mkdir "${f_dest}"/"${ID}"

  echo "############################"
  echo "data transfer ID ${ID}"
  echo "############################"

  cp "${folder}"/NLreg_template_to_MNI_1Warp.nii.gz "${f_dest}"/"${ID}"/NLreg_template_to_MNI_1Warp.nii.gz

  echo "NLreg_template_to_MNI_1Warp.nii.gz transferred"

  cp "${folder}"/NLreg_template_to_MNI_0GenericAffine.mat "${f_dest}"/"${ID}"/NLreg_template_to_MNI_0GenericAffine.mat

  echo "NLreg_template_to_MNI_0GenericAffine.mat transferred"

  cp "${folder}"coreg/NLreg_T1mean_to_template_1Warp.nii.gz "${f_dest}"/"${ID}"/NLreg_T1mean_to_template_1Warp.nii.gz

  echo "NLreg_T1mean_to_template_1Warp.nii.gz transferred"

  cp "${folder}"coreg/coreg_t1slab_to_T1mean_0GenericAffine.mat "${f_dest}"/"${ID}"/coreg_t1slab_to_T1mean_0GenericAffine.mat

  echo "coreg_t1slab_to_T1mean_0GenericAffine.mat transferred"

  cp "${folder}"coreg/NLreg_T1mean_to_template_0GenericAffine.mat "${f_dest}"/"${ID}"/NLreg_T1mean_to_template_0GenericAffine.mat

  echo "NLreg_T1mean_to_template_0GenericAffine.mat transferred"

  cp "${folder}"coreg/coreg_T1mean_to_meanEPI3D1_0GenericAffine.mat "${f_dest}"/"${ID}"/coreg_T1mean_to_meanEPI3D1_0GenericAffine.mat

  echo "coreg_T1mean_to_meanEPI3D1_0GenericAffine.mat transferred"

  cp "${folder}"coreg/T1mean_corrected.nii "${f_dest}"/"${ID}"/T1mean_corrected.nii

  echo "T1mean_corrected.nii transferred"

  cp "${folder}"coreg/EPI4D.nii "${f_dest}"/"${ID}"/EPI4D.nii

  echo "EPI4D.nii transferred"

done < "${f_src}"/LIDO.txt
