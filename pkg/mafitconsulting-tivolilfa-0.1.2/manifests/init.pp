# Class: tivolilfa
# ===========================
#
# For full description see readme.md
#
# Authors
# -------
#
# Author Name <Mark.Fieldhouse@mafitconsulting.co.uk>
#
# Copyright
# ---------
#
# Copyright 2016 mafitconsulting
#
class tivolilfa (

) inherits tivolilfa::params {

	 package { 'ksh':

             name   => $tivolilfa::params::ksh,
             ensure => present,

          }

          package { 'stdcpp_64_package':

             name   => $tivolilfa::params::stdcpp_64_package,
             ensure => present,

          }

          package { 'stdcpp_32_package':

             name   => $tivolilfa::params::stdcpp_32_package,
             ensure => present,

          }

	  package {'compat_64_libs':
             name   => $tivolilfa::params::compat_64_libs,
             ensure => present,

          }

          package { 'compat_32_libs':

             name   => $tivolilfa::params::compat_32_libs,
             ensure => present,

          }

          package { 'gcc_32_package':

             name   => $tivolilfa::params::gcc_32_package,
             ensure => present,

          }



  anchor { 'tivolilfa::begin': } ->
  class { '::tivolilfa::file': } ->
  class { '::tivolilfa::install': } ->
  anchor { 'tivolilfa::end': }

}
