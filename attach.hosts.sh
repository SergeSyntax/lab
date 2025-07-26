#!/usr/bin/bash

function get_private_ip() {
  local num=$1
  virsh domifaddr "k8s-${num}" --source agent | awk '/enp/{print $4}' | cut -d'/' -f1;
}


for i in {1..2}; do
  get_private_ip $i
done

cat << EOF | sudo tee -a /etc/ansible/hosts
[k3s]
k8s-0 ansible_host=$(get_private_ip 0) ansible_user=ubuntu
k8s-1 ansible_host=$(get_private_ip 1) ansible_user=ubuntu
k8s-2 ansible_host=$(get_private_ip 2) ansible_user=ubuntu

[k3s_server]
k8s-0 ansible_host=$(get_private_ip 0) ansible_user=ubuntu

[k3s_agents]
k8s-1 ansible_host=$(get_private_ip 1) ansible_user=ubuntu
k8s-2 ansible_host=$(get_private_ip 2) ansible_user=ubuntu
EOF
