# DMI Community of Practice (CoP) VM

This is a [Vagrant](https://www.vagrantup.com/) project for creating **CentOS7** Development VMs for DMI CoP sessions.

This VM comes equipped with the following tools:

* Default CentOS 7 Tools
* Git
* Python 2.7
* Pip
* Open JDK 8
* Docker

## Installation

We will need to install a VM Manager (Virtualbox), the Vagrant tool, and Git for this project if you have not already done so.

### Windows install using Chocolatey

Run a `CMD` prompt as an **administrator** and install the Chocolatey Package Manager from: https://chocolatey.org/docs/installation.

In the command prompt, type:
```bash
choco install git
choco install virtualbox
choco install vagrant
```

### Mac Install using Homebrew 

Install homebrew in your mac if you have not already done so from here: https://brew.sh/

In a terminal, type:
```bash
brew install git
brew cask install virtualbox
brew cask install vagrant
```

### Traditional Installation / Other OSs

* **Vitualbox** - Download and install Virtualbox from https://www.virtualbox.org/.
* **Vagrant** - Download and install Vagrant from https://www.vagrantup.com/.
* **Git** - Download and install Git from https://git-scm.com/.


## Setup

Let's add `centos/7` base image (or Vagrant box) so that multiple Vagrant environments can re-use it. In the terminal, type:

```bash
vagrant box add centos/7
```

Let's clone this project from GitHub to a folder where you normally clone your other Openlane GitHub projects. In a terminal, type:

```bash
cd <to-your-github-workspace>
git clone https://github.com/allegient-labs/cop-vm.git
cd cop-vm
vagrant up
```

The `vagrant up` command will start and provision your Centos7 VM. If for some reason vagrant cound not find the VM manager, then use `vagrant up --provider virtualbox`. If you already have a VM manager (say Hyper-V) and you skipped virtualbox installation, then use `vagrant up --provider hyperv`.

## Usage

The VM is a bare-bone VM and does not include any GUI packages. So, we need to access it via SSH. Vagrant has already port-forwarded the SSH port in the VM for our use. In order to log into the machine just type `vagrant ssh`. Here is an example session in the terminal that you can try:

```bash
vagrant ssh
git --version
java -version
javac -version
docker run hello-world
exit
```

## Root Access

If you need to issue a command with the root previlege in the VM, then after sshing into the VM, just type `sudo su -` to gain the root access. Here is an example session that you can try out:

```bash
vagrant ssh
sudo su -
whoami
exit
whoami
exit
```

## Updates
If you pulled new changes from the GitHub repo and you want to apply them to your already running VM. After the `git pull` command, just type `vagrant reload --provision`!

## Tear Down
With Vagrant, you can **suspend**, **halt**, or **destroy** the guest machine:
* **Suspend** - Use the `vagrant suspend` command. It will store the current state to resume on `vagrant up`.
* **Halt** - Use `vagrant halt`. It will gracefully shutdown your VM storing content of the disk. On `vagrant up`, it will cold boot the VM.
* **Destroy** - Use `vagrant destroy`. It will delete all traces of the VM including its disk. On `vagrant up`, it rebuilds the VM based on [Vagrantfile](Vagrantfile) and the [bootstrap.sh](bootstrap.sh) provisioning script.
