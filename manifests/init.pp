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
) {
  class { '::ssh::file': }
  class { '::ssh::install': }
  class { '::ssh::config': }

  # Dependency cycle  
  class { '::tivolilfa::file': }
  -> class { '::tivolilfa::install': }
  -> class { '::tivolilfa::config': }
}
