#! /bin/bash

function install_deps() {
    export whereIsTerraform=$(which terraform | grep --quiet no)
    status=$?
    if [ $status == 1 ];
    then
        echo "Terraform not found. Attempting to Install..."
        yum install -y yum-utils
        yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
        yum -y install terraform
    else
        echo "Terraform installed. Proceeding..."
    fi
}

function setup_env() { 
    export dirArray=("gcp-compute-firewall" "gcp-compute-network")
    for dirs in ${dirArray[@]}
    do
        cd ../$dirs
        #TODO: Add error handling for commands
        terraform init
        terraform destroy -auto-approve
        rm -rf .terraform* terraform.*
    done
}

function main() {
    install_deps
    setup_env
}

main