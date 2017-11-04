<<<<<<< HEAD
class tivolilfa::file (
        $itm6fmt        = $tivolilfa::params::lfa_fmt_template, 
        $itm6conf       = $tivolilfa::params::lfa_config_template,
        $silent_install = $tivolilfa::params::silent_install, 
        $silent_config  = $tivolilfa::params::silent_config,
 
) inherits tivolilfa {

        file {["/opt/IBM","/opt/IBM/ITM"]:
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
             content => template("tivolilfa/silent_install.conf.erb"),
        }

	file {'/tmp/silent_config.txt':
             ensure  => file,
             content => template("tivolilfa/silent_config.conf.erb"),
        }

             
=======
# Sets up relevant files
class tivolilfa::file (
  String $itm6fmt        = $::tivolilfa::lfa_fmt_template,
  String $itm6conf       = $::tivolilfa::lfa_config_template,
  String $silent_install = $::tivolilfa::silent_install,
  String $silent_config  = $::tivolilfa::silent_config,
  String $tems_server    = $::tivolilfa::tems_server,
  String $log_sources    = $::tivolilfa::log_sources,
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
>>>>>>> 72db440f269242b73b5d1640b6b7a5b921d97a0f
}
