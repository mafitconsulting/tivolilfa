# tivolilfa

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with tivolilfa](#setup)
    * [What tivolilfa affects](#what-tivolilfa-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with tivolilfa](#beginning-with-tivolilfa)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Puppet module to install IBM Tivoli Log File Agent (ITM) 6.3.0 Fix Pack 1 Agent on RHEL 6,7 and
CentOS 6,7. The Tivoli Log File agent provides data to the IBM Tivoli Monitoring Server (TEMS)

The Log File agent provides a configurable log file monitoring capability that uses
regular expressions. These strings allow the agent to filter the log data according to
patterns in the format file, and submit only the interesting data to an event consumer.

The puppet module installation requires the presence of the 6.3.0-TIV-ITM_LFA-FP0001.tar to be
accessible from a NFS mount configurable in the params class as per user environment.

The Tivoli Enterprise Monitoring server addresss (FQDN or IP Address) must be configured
as the $tems_server in the params class as per the users environment.

The format and configuration files are templated in puppet and can be customised as per
users environment

* Format File => itm6\_lfa_base.fmt.erb
* Config File => itm6\_lfa_base.conf.erb


## Setup

### What tivolilfa affects

The following pre-requisite packages will be installed.

* ksh.x86_64                           : The Original ATT Korn Shell
* libstdc++.x86_64                     : GNU Standard C++ Library
* libstdc++.i686                       : GNU Standard C++ Library
* libgcc.i686                          : GCC version 4.8 shared support library
* nfs-utils.x86_64                     : NFS utilities and supporting clients and daemons for the kernel NFS server
* compat-libstdc++-33                  : Compatibility standard C++ libraries
* compat-libstdc++-33-3.2.3-72.el7.i686: Compatibility standard C++ libraries



Once all pre-reqs are in place, the module attempts to mount the NFS filesystem to a mount point configured in the params class.
Once mounted, it will untar the image and perform a silent installation and configuration of the
agent using templated puppet silent install and config files. The configuration of the agent is based on one install, the instance
name of defined in the params class as $lfa_instance. Log Sources are also defined in the params class under $log_sources are are
set using ruby in the templates for the config file.

* silent install file       => silent\_install.conf.erb
* silent configuration file => silent\_config.conf.erb

Once installed successfully, it will start the agent up (kloagent)

* /opt/IBM/ITM/bin/itmcmd agent -o BASE start lo

and unmount the NFS filesystem.


### Setup Requirements **OPTIONAL**

For the module to install successfully, Security-Enhanced Linux control must be
disabled in the /etc/selinux/config file

SELINUX=disabled

The firewall may require adjustment on the node. See ITM Port Usage in Reference Section


### Beginning with tivolilfa


## Usage

To apply this module, assign the node the class 'tivolilfa' in the PE console, then initiate a Puppet agent run with 'puppet agent -t' run from the node.

The following paramaters must be defined in the params class as per users environment

* tems_server  => Hostname or IP address of TEMS.
* source_dir   => Directory to mount NFS share
* lfa_instance => Name of Log file agent instance
* mount_point  => NFS mount address
* log_sources  => Log sources to monitor



## Reference

Classes

* ::tivolifa
* ::tivolilfa::files
* ::tivolilfa::params
* ::tivolilfa::install

ITM Port Usage - Agents In a default configuration, agents use the following sockets,
1. Connection to a TEMS port 1918. The communications string defines the protocols used. The CT_CMSLIST environment variable names the servers where a TEMS is running. The initial connection at port 1918 gives access to the Location Broker data and thus indirectly to the TEMS. However from the standpoint of configuration, this is a socket to a 1918 listening port on the server running the TEMS.
2. Agent listening port at 1918+N*4096. If there is just one agent installed, the listening port will be 1918+4096 or 6014. If there are more than one agent installed, the agents contend for the listening ports. That means incidentally that there are a maximum of 15 agents using the default configuration. The listening port is used for several purposes including retrieval of real time data and receiving broadcasts about new WPA address.
3. Ephemeral ports. ITM makes use of ports which are received from TCP/IP as "the next free port". These are used to communicate between ITM sub-systems.
4. Local ports. These are on address 0.0.0.0 and 127.0.0.1 which are not internet capable addresses. They are used to maintain awareness between ITM processes such as handling the internal web server switch process.


## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.




