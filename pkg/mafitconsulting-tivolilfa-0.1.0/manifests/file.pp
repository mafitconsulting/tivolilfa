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

             
}
