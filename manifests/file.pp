# Sets up relevant files
class tivolilfa::file (
  String $itm6fmt        = $::tivolilfa::lfa_fmt_template,
  String $itm6conf       = $::tivolilfa::lfa_config_template,
  String $silent_install = $::tivolilfa::silent_install,
  String $silent_config  = $::tivolilfa::silent_config,
) {

  file {['/opt/IBM','/opt/IBM/ITM']:
    ensure   => directory,
  }

  file {'/opt/IBM/ITM/itm6_lfa_base.conf':
    ensure  => file,
    require => File['/opt/IBM/ITM'],
    content => template("tivolilfa/${itm6conf}.erb"),
  }

  file {'/opt/IBM/ITM/itm6_lfa_base.fmt':
    ensure  => file,
    require => File['/opt/IBM/ITM'],
    content => template("tivolilfa/${itm6fmt}.erb"),
  }

  file {'/tmp/silent_install.txt':
    ensure  => file,
    content => template('tivolilfa/silent_install.conf.erb'),
  }

  file {'/tmp/silent_config.txt':
    ensure  => file,
    content => template('tivolilfa/silent_config.conf.erb'),
  }
}
