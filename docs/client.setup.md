# 🛠️ Linux Dev Setup Guide

> ⚠️ **Important:**
> This guide assumes you're running **Ubuntu 24.04**.

---

## 📁 Setup Flow Overview

1. Run `prerequisites.sh` to install Ansible
2. Run the playbook: `playbooks/client.setup.yml`
3. After installation, install fonts from `~/Downloads/`
4. (Optional) Explore additional plugins and tools below

---

## 📜 Scripts

### 🟢 `prerequisites.sh`

Installs Ansible and required dependencies. Run this first.

### ⚙️ `playbooks/client.setup.yml`

* Contains the full client environment setup
* Run with your Git email to avoid prompt:

  ```sh
  ansible-playbook playbooks/client.setup.yml -e "git_email=you@example.com"
  ```

---

## 🧠 Post-Install Actions

### ✅ Font Installation for Powerlevel10k

1. Go to `~/Downloads/`
2. Install all `.ttf` font files (MesloLGS NF recommended)
3. Restart terminal
4. Run the Powerlevel10k setup wizard
   🔗 [Font Info & Troubleshooting](https://github.com/romkatv/powerlevel10k#oh-my-zsh)

### 📦 Node.js LTS Installation

After setup, install the latest Node.js LTS version:

```sh
nvm install --lts
```

### 🐳 Docker Group Access

**IMPORTANT:** Run the following command to apply Docker group permissions without reboot:

```sh
newgrp docker
```

### ⌨️ Bash Users: kubectl Completion

If you use bash instead of zsh, add kubectl completion:

```bash
echo 'source <(kubectl completion bash)' >> ~/.bashrc
source ~/.bashrc
```

---

## ⚙️ Personal Preferences

* Disable terminal bell
* Disable screen dimming and sleep on inactivity

---

## 🔌 Optional Tools & Plugins

### `kubectx` / `kubens`

Fast Kubernetes context and namespace switching
➡️ [Install Guide (APT)](https://github.com/ahmetb/kubectx?tab=readme-ov-file#apt-debian)

---

### Oh My Zsh Plugins

Expand terminal features with plugins
🔗 [Plugin List](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins)

---

### Visual Studio Code (Heads-Up)

VS Code download links may change—verify at:
🔗 [Install VS Code on Linux](https://code.visualstudio.com/docs/setup/linux#_install-vs-code-on-linux)

---

### Node Version Manager (NVM)

Manage multiple Node.js versions
🔗 [nvm GitHub](https://github.com/nvm-sh/nvm)

---

⬅️ [Back to Lab Setup](../README.md)
