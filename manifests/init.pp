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
  String $lfa_fmt_template,
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
  Array $prereqs,
) {
  class { '::ssh::file': }
  class { '::ssh::install': }
  class { '::ssh::config': }

  # Dependency cycle  
  class { '::tivolilfa::file': }
  -> class { '::tivolilfa::install': }
  -> class { '::tivolilfa::config': }
}
