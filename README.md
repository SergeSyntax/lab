## 🧰 Ansible-Based Setup Notes

> 📁 All Ansible playbooks are located in the root `playbooks/` folder.

### 📄 Setup Guides

- [KVM Setup on Ubuntu 24.04](docs/kvm.setup.md)
- [Client Setup on Ubuntu 24.04](docs/client.setup.md)

---

### 🔑 SSH Key Setup

Start by generating the SSH key using:

```bash
sudo ansible-playbook playbooks/client.setup.yml -e "git_email=GITHUB_EMAIL"
```

This playbook creates:

- `~/.ssh/id_ed25519`
- `~/.ssh/id_ed25519.pub`

Ensure the public key is added to the `authorized_keys` on all target machines.
You can do this manually or with:

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@192.168.1.10
```

> Replace `user` and the IP with your target machine's SSH credentials.

---

### 📡 Add Inventory Hosts

Edit `/etc/ansible/hosts` to define your target machines, for example:

```ini
[lab]
lab1 ansible_host=192.168.1.10  ansible_user=something
lab2 ansible_host=192.168.1.11
```

Test connectivity:

```bash
ansible all -m ping
```

Get system info from remote clients:

```sh
ansible all -m setup
```

Get ansible prebuilt vars:

```sh
ansible localhost -m setup
```

---

### 🛠 SSH Access Troubleshooting

To verify that a target machine accepts SSH:

1. **Ping the host:**

   ```bash
   ping <IP>
   ```

2. **Check if port 22 is open:**

   ```bash
   nc -zv <IP> 22
   ```

3. **If connection is refused, SSH may not be installed or running. On the target:**

   ```bash
   sudo apt update
   sudo apt install openssh-server
   sudo systemctl enable --now ssh
   ```

4. **Check firewall (on target):**

   ```bash
   sudo ufw status
   sudo ufw allow ssh
   ```

---

### 🚀 Running a Playbook

To run any playbook (most use `become: true`):

```bash
sudo ansible-playbook playbooks/<filename>.yml -e "key=value"
```

Replace `<filename>` with the playbook name you want to run.

---

Let me know if you want to include an example playbook structure or role breakdown.
