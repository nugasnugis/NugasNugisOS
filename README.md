# NugasNugisOS

**NugasNugisOS (NNOS)** is a Debian-based Linux distribution focused on everyday desktop use and gaming, with optional security/pentesting tooling.

## Current target

- Base: Debian 14 development branch (Forky / testing)
- Desktop: KDE Plasma
- Architecture: x86_64 (amd64)
- Installer: Calamares
- Package manager: `nnosm` (NugasNugisOS Manager)
- Native package format: `.nnpk` (with `.nnospk` reserved as an alias)
- Repository: GitHub Pages
- CI/CD: GitHub Actions
- Update frontend: `nnos-update` CLI first, KDE GUI later

## Live environment

```
Liveboot NNOS
    ↓
Try NNOS
    ↓
KDE Plasma
    ↓
Install NNOS
    ↓
Calamares
```

## Project status

NNOS is currently in early development. The first milestone is a reproducible amd64 live ISO build in GitHub Actions.

## Repository layout

```
.github/workflows/   CI/CD
build/               ISO and build scripts
config/              system, desktop and branding configuration
packages/            NNOS-native packages
artwork/             logos, wallpapers and other artwork
installer/           Calamares configuration
```
