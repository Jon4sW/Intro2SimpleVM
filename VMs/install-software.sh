#!/bin/bash

home_path='/home/ubuntu'
username='ubuntu'
miniforge_version='23.11.0-0'
pangenie_version='3.0.0'
minimap2_version='2.26'
graphtyper2_version='v2.7.5'
rtgtools_version='3.12.1'
truvari_version='4.1.0'
gdown_version='5.0.0'
bayestyper_version='v1.5'
paragraph_version='v2.4a'
snakemake_version='8.2.0'

echo $home_path
echo 'export PATH=$home_path/miniforge3/bin:\$PATH' >> $home_path/.bashrc

# # Download mamba
# wget https://github.com/conda-forge/miniforge/releases/download/$miniforge_version/Mambaforge-$miniforge_version-Linux-x86_64.sh -O /tmp/mamba.sh
# chmod 0744 /tmp/mamba.sh

# # Install mamba
# /tmp/mamba.sh -b -f -p $home_path/miniforge3

# # Add Mamba and Conda to PATH environment variable
# echo 'export PATH=$home_path/miniforge3/bin:$PATH' >> $home_path/.bashrc

# # Install apt packages
# sudo apt-get update
# sudo apt-get install -y build-essential cmake libgsl-dev libhts-dev libjemalloc-dev libz-dev libzstd-dev python3-distutils python3-dev pkg-config unzip bedtools samtools bcftools vcftools kmc bwa

# # Install snakemake with mamba
# $home_path/miniforge3/bin/mamba create -c conda-forge -c bioconda -n snakemake -y snakemake=$snakemake_version

# # Copy snakemake to path
# sudo cp $home_path/miniforge3/envs/snakemake/bin/snakemake /usr/local/bin/snakemake
# sudo chown $username:$username /usr/local/bin/snakemake
# sudo chmod 0755 /usr/local/bin/snakemake

# # Download and install pangenie
# wget https://github.com/eblerjana/pangenie/archive/refs/tags/v$pangenie_version.tar.gz -O /tmp/pangenie_$pangenie_version.tar.gz
# tar -xzvf /tmp/pangenie_$pangenie_version.tar.gz -C $home_path/
# $home_path/miniforge3/bin/mamba env create -f environment.yml -p $home_path/pangenie-$pangenie_version

# # Build pangenie
# mkdir -p $home_path/pangenie-$pangenie_version/build
# cd $home_path/pangenie-$pangenie_version/build
# source $home_path/miniforge3/etc/profile.d/conda.sh
# conda activate pangenie
# cmake ..
# make

# # Copy pangenie to path
# sudo cp $home_path/pangenie-$pangenie_version/build/src/PanGenie /usr/local/bin/PanGenie_v$pangenie_version
# sudo cp $home_path/pangenie-$pangenie_version/build/src/PanGenie-index /usr/local/bin/PanGenie_v$pangenie_version-index
# sudo chown $username:$username /usr/local/bin/PanGenie_v$pangenie_version /usr/local/bin/PanGenie_v$pangenie_version-index
# sudo chmod 0755 /usr/local/bin/PanGenie_v$pangenie_version /usr/local/bin/PanGenie_v$pangenie_version-index

# # Install truvari using pip
# $home_path/miniforge3/bin/pip3 install truvari==$truvari_version

# # Copy truvari to path
# sudo cp $home_path/miniforge3/bin/truvari /usr/local/bin/truvari
# sudo chown $username:$username /usr/local/bin/truvari
# sudo chmod 0755 /usr/local/bin/truvari

# #!/bin/bash

# # Continue from previous script...

# # Download and install bayesTyper
# wget https://github.com/bioinformatics-centre/BayesTyper/releases/download/$bayestyper_version/bayesTyper_$bayestyper_version\_linux_x86_64.tar.gz -O /tmp/bayesTyper_$bayestyper_version\_linux_x86_64.tar.gz
# tar -xzvf /tmp/bayesTyper_$bayestyper_version\_linux_x86_64.tar.gz -C /tmp/
# sudo cp /tmp/bayesTyper_$bayestyper_version\_linux_x86_64/bin/bayesTyper /usr/local/bin/bayesTyper
# sudo cp /tmp/bayesTyper_$bayestyper_version\_linux_x86_64/bin/bayesTyperTools /usr/local/bin/bayesTyperTools
# sudo chown $username:$username /usr/local/bin/bayesTyper /usr/local/bin/bayesTyperTools
# sudo chmod 0755 /usr/local/bin/bayesTyper /usr/local/bin/bayesTyperTools

# # Download and unzip Paragraph
# wget https://github.com/Illumina/paragraph/releases/download/$paragraph_version/paragraph-$paragraph_version-binary.zip -O /tmp/paragraph.zip
# mkdir -p /tmp/paragraph
# unzip /tmp/paragraph.zip -d /tmp/paragraph
# sudo cp /tmp/paragraph/bin/paragraph /usr/local/bin/paragraph
# sudo chown $username:$username /usr/local/bin/paragraph
# sudo chmod 0755 /usr/local/bin/paragraph

# # Download and unzip RTG Tools
# wget https://github.com/RealTimeGenomics/rtg-tools/releases/download/$rtgtools_version/rtg-tools-$rtgtools_version-linux-x64.zip -O /tmp/rtgtools.zip
# unzip /tmp/rtgtools.zip -d $home_path
# # RTG Tools does not require copying to bin as it can be run from its directory

# # Download and unzip minimap2
# wget https://github.com/lh3/minimap2/releases/download/v$minimap2_version/minimap2-$minimap2_version\_x64-linux.tar.bz2 -O /tmp/minimap2.tar.bz2
# tar -xvjf /tmp/minimap2.tar.bz2 -C /tmp/
# sudo cp /tmp/minimap2-$minimap2_version\_x64-linux/minimap2 /usr/local/bin/minimap2
# sudo chown $username:$username /usr/local/bin/minimap2
# sudo chmod 0755 /usr/local/bin/minimap2

# # Download graphtyper
# wget https://github.com/DecodeGenetics/graphtyper/releases/download/$graphtyper2_version/graphtyper -O /usr/local/bin/graphtyper
# sudo chown $username:$username /usr/local/bin/graphtyper
# sudo chmod 0755 /usr/local/bin/graphtyper

# # Install gdown using pip
# $home_path/miniforge3/bin/pip3 install gdown==$gdown_version

# # Copy gdown to path
# sudo cp $home_path/miniforge3/bin/gdown /usr/local/bin/gdown
# sudo chown $username:$username /usr/local/bin/gdown
# sudo chmod 0755 /usr/local/bin/gdown

# # Add conda init bash to .bashrc (if not already added)
# if ! grep -q "conda init bash" $home_path/.bashrc; then
#     echo "conda init bash" >> $home_path/.bashrc
# fi

# # Reload bash
# source $home_path/.bashrc

