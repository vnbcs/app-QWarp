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
template=`jq -r '.template' config.json`

# following creates an output filename w a suffix
output_fn=t1_qwarp.nii.gz

# create new directory skullStrip for t1w file and output
echo "creating skullStrip folder..."
mkdir -p skullStrip

# move file to new directory skullStrip
install $t1 skullStrip/t1.nii.gz

# run 3dSkullStrip
echo "running 3dSkullStrip..."
if [ "$optional_params" != "null" ]; then
    3dSkullStrip -input ./skullStrip/t1.nii.gz -prefix ${output_fn} ${optional_params}
else
    3dSkullStrip -input ./skullStrip/t1.nii.gz -prefix ${output_fn}
fi

3dQwarp -allineate -prefix sub-0202_T1wQ -blur 0 3 -base $template -source $t1 -minpatch 7 -Qfinal -workhard

# move output to output folder
echo "creating output folder..."
mkdir -p output
cp t1_ss.nii.gz output/t1.nii.gz

echo "process complete"
