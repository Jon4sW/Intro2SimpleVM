# Intro2SimpleVM
Workshop repository for an introduction to SimpleVM (cloud computing resources within de.NBI - German Network for Bioinformatics Infrastructure)


# Overview 
1. VMs:  Creation, Access and Management

2. Workflow execution using Snakemake

3. Research Environments (web-based IDEs, etc, …)
    - Theia IDE
    - VS Code
    - Apache Guacamole
    - Rstudio
    - JupyterLab

4. (Advanced) Collaboration through Version Control Systems (GitHub)

5. (Advanced) Automation with Ansible


# (Local) Requirements

- SSH for accessing the VM
- A key-pair (private and public keys) set up in the deNBI Cloud. To do so, go to your desired local folder and:  `ssh-keygen -t rsa -f key_filename` > `chmod 400 /path/to/key_filename` (set only-read permissions for your user) > check that permissions are `-r--------` with `ls -l /path/to/key_filename`.
- Ansible for "(Advanced) Automation with Ansible" section --> "Installing Ansible" section from the [official Ansible documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html). To test it, run `ansible --version` in terminal. Please be sure that the executables have been added to your path. 

# 1. VMs:  Creation, Access and Management
After visiting [denbi Cloud](https://cloud.denbi.de/portal/webapp) and logging in, complete the following steps: 

- Check that you're Public Key is set up in your Profile. Otherwise, upload your public key (i.e. key_filename.pub) to your profile.

- Create a New Instance / VM for project Intro2SimpleVM (name: VMaldes, Flavor: deNBI medium, Image: Ubuntu 22.04 LTS and checkbox for responsibilities)

- Prepare your SSH connection:  To do so, create an entry in your (i.e. locally) SSH configuration file (located at `~/.ssh/config`) in order to register the hostnames of the VMs in the deNBI Cloud and access them more quickly through SSH (without specifying passwords at every log in). An example for such an entry goes as follows:

```
Host nickname_to_access_this_host
    HostName VM_IP_address
    User ubuntu
    AddKeysToAgent yes
    IdentityFile /path/to/private_key/for/deNBI_Cloud
    Port port_to_connect_to_VM
```

Please feel free to adapt the values `nickname_to_access_this_host`, `VM_IP_address`, `/path/to/private_key/for/deNBI_Cloud` and `port_to_connect_to_VM` to your specific situation.   

Now you can access your VM with `ssh nickname_to_access_this_host`. 

- Before proceeding to the software installation, **fork** this repo to create your OWN copy of the repo and then clone it in the VM home directory with `git clone https://github.com/{your_username}/Intro2SimpleVM.git`. Note: See Section 4 if you get `Permission denied (publickey)`. You'll need to set up an authentification between your VM and your GitHub (e.g. through an SSH key). 

- Install necessary software for the Snakemake pipeline execution. To do so, inspect the file [software installation](https://github.com/albertodescalzo/Intro2SimpleVM/VMs/install-software.sh) and from the `Intro2SimpleVM` folder execute it with `VMs/install-software.sh`. After the installation process complete, log out and log in again. Next, run `VMs/test-software.sh`. Observe whether the different software packages were installed correctly or contrarily there is any error.

# 2. Workflow execution using Snakemake

After setting up the software, we can run a small inference pipeline developed in Snakemake. [This workflow](https://github.com/albertodescalzo/Intro2SimpleVM/workflow) evaluates and benchmark the following three state-of-the-art graph-genome-based approaches: [PanGenie](https://github.com/eblerjana/pangenie), [BayesTyper](https://github.com/bioinformatics-centre/BayesTyper) and [GraphTyper](https://github.com/DecodeGenetics/graphtyper). 

For a more accurate description of what the pipeline do, please read [here](https://github.com/DiltheyLab/graph-genome-workbench/blob/master/evaluation_pipeline/README.md).

We'll run the workflow with the following commands:

- `cd evaluation_pipeline`
- `snakemake --profile workflow/profile-default/ -s workflow/rules/download-data.smk  download_data` 
- `workflow/scripts/reduce-data.sh`
- `snakemake --profile workflow/profiles-reduced-data/ evaluation` 

To observe/modify the files' content, access the web-based research environment in your browser. 

# 3. Research Environments

- Delete your previous ubuntu-imaged VM machine (if you have the permissions for that, otherwise ask your administrator).

- Inspect the different research environments SimpleVM offers. Let's now create an instance with e.g. VSCode as a research environment (name: VMaldes, Flavor: deNBI medium, Image: VSCode-ubuntu22.04 deNBI and double checkbox for responsibilities and agreement)

- Repeat process of Step 1

# 4. (Advanced) Collaboration through Version Control Systems (GitHub)

Since in Step 1 you forked this repo, we'll perform some modifications and add them to your forked repository. 

After the modifications have been carried out, follow these steps:

- Access your VM
- Create a ssh-keypair with `ssh-keygen -t ed25519 -C "user.email"`. This will generate the public and private keys in `~/.ssh/id_ed25519`. Moreover, run `chmod 400 ~/.ssh/id_ed25519` so that the key is only readable by your user.
- In GitHub: Go to `Settings` > `SSH and GPG keys` > `New SSH key` > Add your public key.

Now you should be able to pull/push/etc... to your repo. To check it, run:

- `git clone ssh_URL_repository`, similar to `git clone git@github.com:Github_user/repo.git`

Note: Please consider this additional step if you renamed your created ssh key adding it to the ssh agent every time (per sign in) if you want to use it. This can be achieved with the commands: `eval "$(ssh-agent -s)"`and `ssh-add ~/.ssh/keyname`.

# 5. (Advanced) Automation with Ansible

In order to demonstrate how powerful Ansible is, we'll repeat step 1 , however, for the installation of the software, we'll do it locally (i.e. from our laptop, instead of connecting to the VM and execution the shell script). To do so, we first need to install Ansible as described in Requirements. Then, follow the next steps in your locally clone repo:

- In the [inventory file](https://github.com/albertodescalzo/Intro2SimpleVM/Ansible/inventory), specify your VM hostname under "[my_machines]". Moreover, in `Ansible/main.yml` comment the line `hosts: localhost` and uncomment `#hosts: denbi_vms`.

- Download the Pangenotyping role from the Ansible-Galaxy community by executing `ansible-galaxy role install albertodescalzo.pangenotyping`

- Then, clone the repo in  your desired directory, and execute `ansible-playbook Ansible/main.yml` in the directory folder.

For more details about the tasks in the role, please visit [the role description](https://github.com/albertodescalzo/ansible-role-pangenotyping). More roles can be found under [Ansible-Galaxy website](https://galaxy.ansible.com/ui/standalone/roles/).