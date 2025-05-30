# KVM Setup on Ubuntu 24.04

> ⚠️ **Important:**  
> This guide assumes you're running **Ubuntu 24.04**.  
> The playbook includes assumptions about your network and system.  
> - **Recommended:** Read and **review each task** before running.  
> - Even better: **Comment out tasks** and run them step-by-step.  
> - If unsure or using it for the first time, **disable your network** before running.

## 1. Check Virtualization Support

Run the following command to check if your CPU supports virtualization:

```sh
lscpu | grep Virtualization
```

If supported, you’ll see output like `VT-x` (Intel) or `AMD-V`.

> ✅ Make sure **VT-x** (Intel) or **AMD-V** (AMD) and **VT-d** are enabled in your BIOS.

## 2. Check NetworkManager Status

Ensure `NetworkManager` is running:

```sh
sudo systemctl status NetworkManager
```

## 3. Full KVM Setup Guide

Follow this detailed guide to turn Ubuntu 24.04 into a KVM hypervisor:
🔗 [KVM Setup Guide – FreeCodeCamp](https://www.freecodecamp.org/news/turn-ubuntu-2404-into-a-kvm-hypervisor/)

---

⬅️ [Back to Lab Setup](../README.md)
