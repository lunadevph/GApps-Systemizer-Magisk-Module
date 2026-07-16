# GApps Systemizer (Magisk / KernelSU Module)

Systemlessly install and systemize Google Apps (GApps) using **Magic Mount** or **OverlayFS**, without modifying the `/system` partition.

## Features ✨

- ✅ Systemlessly installs GApps
- ✅ Leaves the physical `/system` partition untouched
- ✅ Supports Magisk, KernelSU, and KernelSU Next!
- ✅ Lightweight and open source


## Android Version Support 🤝

| Android Version | Codename | Support |
|-----------------|----------|:-------:|
| Android 16 | Baklava | ✅ Supported |
| Android 15 and below | — | ❌ Not Supported |

 **Note:** This module is **exclusively designed for Android 16**.

## Root Solution Support 🤝

| Root Solution | Support | Notes |
|---------------|:-------:|-------|
| Magisk | ✅ | Works out of the box. |
| KernelSU | ✅ | **Requires Meta OverlayFS** to be installed first. |
| KernelSU Next | ✅ | **Requires Meta OverlayFS** to be installed first. |
| APatch/FolkPatch | ❓ | **Not tested** |

 **Important:** If you're using **KernelSU** or **KernelSU Next**, install **Meta OverlayFS** before installing this module. Without it, the module will not function correctly.

## Requirements 📌

- Android 16 (Baklava)
- ARM64 device
- Root access via Magisk, KernelSU, or KernelSU Next
- **Meta OverlayFS** (required only for KernelSU and KernelSU Next)

## Installation ⬇️

1. Install your preferred root solution.
2. **(KernelSU / KernelSU Next only)** Install **Meta OverlayFS**.
3. Install this module.
4. Reboot your device.

## Building 🔨

1. First, clone this repository via **git clone**
2. Then, go to the BuildScripts Folder and run the following
```bash
./build.sh
```
3. If you are using Windows, Run **build.bat**
```cmd
cmd /c build.bat
```