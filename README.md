# modern_shell_tools

## Table of Contents

- [modern_shell_tools](#modern_shell_tools)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [What modern_shell_tools affects **OPTIONAL**](#what-modern_shell_tools-affects-optional)
    - [Setup Requirements **OPTIONAL**](#setup-requirements-optional)
  - [Reference](#reference)
  - [Usage](#usage)
    - [Single tool installation](#single-tool-installation)
    - [Install all tools](#install-all-tools)
  - [Tools](#tools)
    - [Sources](#sources)

## Description

Installs a set of modern commandline tools

## Setup

### What modern_shell_tools affects **OPTIONAL**

It installs a set of modern commandline tools in `/opt/mst` and links it to `/usr/local/sbin`.

For some tools packages exist, for some not. To have a more or less unified way to get the tools without to much hasle we download them directly from their github release pages as binary archives.

### Setup Requirements **OPTIONAL**

puppet-archive and puppetlabs-vcsrepo are needed.

## Reference

See [REFERENCES.md](REFERENCES.md)

Generate file with

    puppet strings generate --format markdown --out REFERENCES.md


## Usage

### Single tool installation

Just include the desired class like:

    include modern_shell_tools::install::broot

### Install all tools

Include the main class

    include modern_shell_tools


## Tools

included are:

    bashtop-0.9.25 ... an advanced top alternative
    broot-1.13.1   ... a tree explorer and a customizable launcher
    dyff-1.5.4     ... a diff tool for YAML files
    exa-0.10.0     ... a colorful ls replacement
    jc-1.20.0      ... converts the output of many commands and file-types to JSON
    jq-1.6         ... a commandline JSON processor
    lfs-2.5.0      ... a linux utility listing your filesystems
    viddy-0.3.6    ... a replacement for watch-command
    xsv-0.13.0     ... a command line program for handling CSV files

### Sources
- https://github.com/aristocratos/bashtop
- https://github.com/Canop/broot
- https://github.com/homeport/dyff
- https://github.com/ogham/exa
- https://github.com/kellyjonbrazil/jc
- https://github.com/stedolan/jq
- https://github.com/Canop/lfs
- https://github.com/sachaos/viddy
- https://github.com/BurntSushi/xsv
