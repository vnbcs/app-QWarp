[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.346-blue.svg)](https://doi.org/10.25663/brainlife.app.346)

# app-QWarp

This App runs AFNI's 3dQwarp function over a 3D/4D NIfTI file

[See the AFNI documentation for 3dQwarp](https://afni.nimh.nih.gov/pub/dist/doc/program_help/3dQwarp.html).

To use this app, add all optional tags
### Authors
- [Eva Bacas](e.bacas@pitt.edu)

### Contributors
- Jamie Hanson

### Funding Acknowledgement
brainlife.io is publicly funded and for the sustainability of the project it is helpful to Acknowledge the use of the platform. We kindly ask that you acknowledge the funding below in your publications and code reusing this code.

[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Citations
We kindly ask that you cite the following articles when publishing papers and code using this code.

1. Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). [https://doi.org/10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y).
2. Cox RW (1996) AFNI: software for analysis and visualization of functional magnetic resonance images. Comput Biomed Res 29:162–173. [https://doi.org/10.1006/cbmr.1996.0014](https://doi.org/10.1006/cbmr.1996.0014)

#### MIT Copyright (c) 2021 brainlife.io The University of Texas at Austin

## Running the App

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/bl.app.346](https://doi.org/10.25663/bl.app.346) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
	"t1":	"/testdata/t1/t1.nii.gz",
	"template": "template/MNI152_T1_2009c+tlrc.BRIK.gz",
	"optional_params": "-allineate -blur 0 3 -minpatch 7 -Qfinal -workhard"
}
```

3. Launch the App by executing `main`

```bash
./main
```

### Sample Datasets

If you don't have your own input file, you can download sample datasets from Brainlife.io, or you can use [Brainlife CLI](https://github.com/brain-life/cli).

```
npm install -g brainlife
bl login
mkdir input
bl dataset download 5a0e604116e499548135de87 && mv 5a0e604116e499548135de87 input/track
bl dataset download 5a0dcb1216e499548135dd27 && mv 5a0dcb1216e499548135dd27 input/dtiinit
```

## Output

`t1.nii.gz`

### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies.  

  - AFNI: [https://afni.nimh.nih.gov/](https://afni.nimh.nih.gov/)
  - JQ: [https://stedolan.github.io/jq/](https://stedolan.github.io/jq/)

#### MIT Copyright (c) 2021 brainlife.io The University of Texas at Austin
