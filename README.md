## Vagrant and Ansible Playbook for Minikube, Docker, and Kubernetes Setup

## Overview about the setup

This Ansible playbook and role-based structure are designed to automate the setup of Minikube, Docker, Kubernetes, and a Deployment that says "Hello World SpreadGroup" 
Vagrant Configuration for Minikube on Fedora 36.

Regarding Vagrant configuration file is designed to set up a virtual machine environment for running Minikube on Fedora 36. It utilizes VirtualBox as the provider to create a development environment for Kubernetes-based applications.

    The base image is set to "fedora/36-cloud-base," and the virtual machine is named "fedora-minikube."

Provider Configuration

    Configuration settings for memory (4048 MB) and CPU (2 cores).

Synced Folder

    The current directory on your host machine (the directory containing this Vagrant file) is synced with the /home/vagrant directory on the virtual machine. 
    This enables easy file sharing between the host and guest.

SSH Configuration

    SSH key insertion is enabled for secure SSH access to the virtual machine.
    SSH agent forwarding is enabled, allowing the virtual machine to use your host machine's SSH agent for authentication.

Port Forwarding

    Ports are forwarded from the guest virtual machine to the host machine. These include ports for web applications (port 80) where the deployment that says hello world will be.

Virtual Machine Definition

    The virtual machine definition includes the specified base image and hostname.
    A private network with a static IP address (192.168.100.10) is configured to facilitate communication between the host and guest.
    Ansible provisioning is set up, and an Ansible playbook (playbook.yml) is specified for configuration tasks.
    Extra variables, such as node_ip, can be passed to the Ansible playbook for customization.


## Prerequisites

Before you begin, ensure you have the following:

- VirtualBox
- Vagrant

## Getting Started

## Project Structure
  ```sh
     SpreadGroupAnsible/ 
    ├── ansible_roles/
    │   ├── roles
    │        ├── common
    │              ├── tasks
    │                   ├── main.yml
    │        ├── kubernetes
    │              ├── defaults
    │                   ├── main.yml
    │              ├── tasks
    │                   ├── deploy.yml
    │                   ├── docker.yml
    │                   ├── ingress.yml
    │                   ├── main.yml
    │                   ├── minikube.yml
    │                   ├── kubectl.yml
    ├── deployments/
    │   ├── Dockerfile
    │   ├── hello-world-deployment.yaml
    │   ├── hello-world-ingress.yaml
    │   ├── hello-world-service.yaml
    │   ├── index.html
    └── ansible.cfg
    │
    ├── playbook.yml
    ├── README.md
    ├── Vagrantfile
  ```
### Run the Vagrant environment:
go inside the directory where the Vagrantfile is and run the following command
   ```sh
   vagrant up
   ```
when the vagrant and ansible playbook finishes go to your host machine web browser and write localhost
you should see a page that says Hello World 2024
## Cleanup
- When you're done using the setup, you can clean up the environment:

```sh
vagrant destroy
```