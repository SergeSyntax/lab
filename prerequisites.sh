#!/usr/bin/env bash

sudo apt update -y;
sudo apt upgrade -y;
sudo add-apt-repository --yes --update ppa:ansible/ansible;
sudo apt install -y software-properties-common ansible;
