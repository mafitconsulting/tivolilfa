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
<<<<<<< HEAD
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

=======
# Copyright 2017 mafitconsulting
#
class tivolilfa (
  String $lfa_fmt_template,
  String $lfa_config_template,
  String $tmp_dir,
  String $source_dir,
  String $lfa_tar,
  String $tems_server,
  String $silent_install,
  String $silent_config,
  String $lfa_instance,
  String $log_sources,
  String $mount_point,
  String $itm_home,
  String $ext_src_dir,
  Array[String] $prereqs,
) {

  class { '::tivolilfa::file': }
  -> class { '::tivolilfa::install': }
  -> class { '::tivolilfa::config': }
>>>>>>> 72db440f269242b73b5d1640b6b7a5b921d97a0f
}
