# modern_shell_tools

## Table of Contents

- [modern_shell_tools](#modern_shell_tools)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [What modern_shell_tools affects **OPTIONAL**](#what-modern_shell_tools-affects-optional)
    - [Setup Requirements **OPTIONAL**](#setup-requirements-optional)
  - [Reference](#reference)

## Description

Installs a set of modern commandline tools

## Setup

### What modern_shell_tools affects **OPTIONAL**

It installs a set of modern commandline tools in `/opt/mst` and links it to `/usr/local/sbin`.

### Setup Requirements **OPTIONAL**

puppet-archive and puppetlabs-vcsrepo are needed.

## Reference

See [REFERENCES.md](REFERENCES.md)

Generate file with

    puppet strings generate --format markdown --out REFERENCES.md
