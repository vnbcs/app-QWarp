#!/bin/bash

# trying to make AFNI not whine about lack of display
echo "creating xvfb display..."
Xvfb :88 &
export DISPLAY=:88

# load filename and optional parameters
echo "loading filename and optional parameters..."
t1=`jq -r '.t1' config.json`
optional_params=`jq -r '.optional_params' config.json`

# current there is only ONE option for template
# this is in here jic we decide to add more
echo "loading template..."
template=`jq -r '.template' config.json`

# following creates an output filename w a suffix
output_fn=t1_qwarp.nii.gz

# create new directory QWarp for t1w file and output
echo "creating QWarp folder..."
mkdir -p QWarp

# move file to new directory skullStrip
install $t1 QWarp/t1.nii.gz

# run 3dQwarp
echo "running 3dQwarp..."
if [ "$optional_params" != "null" ]; then
    3dQwarp -source ./QWarp/t1.nii.gz -base $template -prefix ${output_fn} ${optional_params}
else
    3dQwarp -source ./QWarp/t1.nii.gz -base $template -prefix ${output_fn}
fi

# move output to output folder
echo "creating output folder..."
mkdir -p output
cp t1_qwarp.nii.gz ./output/t1.nii.gz

echo "process complete"
