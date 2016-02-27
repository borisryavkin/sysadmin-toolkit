# Remote Server Tools

A small collection of Bash and SSH administration scripts representing checks performed across Linux machines in 2017. The scripts read a local host list and retrieve basic uptime, disk, memory, and service/process information.

## Usage

Create a host file from the example, using SSH destinations you can access:

```sh
cp hosts.example hosts
chmod +x check-hosts.sh disk-usage.sh service-status.sh
./check-hosts.sh hosts
./disk-usage.sh hosts
./service-status.sh hosts sshd
```

## Requirements

`/bin/bash`, `ssh`, `uptime`, `df`, `free`, `ps`, and standard shell utilities. SSH key authentication is recommended.

## Notes

Hosts are not stored in the repository. Comments and blank lines in host files are ignored.
