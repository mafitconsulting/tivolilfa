function tivolilfa::data() {
  $os_params = case $facts['os']['family'] {
    'RedHat': {
        {'tivolilfa::lfa_config_template' => 'itm6_lfa_base.conf',
        'tivolilfa::lfa_fmt_template'     => 'itm6_lfa_base.fmt',
        'tivolilfa::tmp_dir'              => '/tmp',
        'tivolilfa::source_dir'           => '/var/nfsshare',
        'tivolilfa::lfa_tar'              => '6.3.0-TIV-ITM_LFA-FP0001.tar',
        'tivolilfa::tems_server'          => 'puppet.localdomain',
        'tivolilfa::silent_install'       => 'silent_install.txt',
        'tivolilfa::silent_config'        => 'silent_config.txt',
        'tivolilfa::lfa_instance'         => 'BASE',
        'tivolilfa::log_sources'          => '/tmp/test.log,/tmp/testing.log',
        'tivolilfa::mount_point'          => '192.168.38.159:/var/lfaimage',
        'tivolilfa::itm_home'             => '/opt/IBM/ITM',
        'tivolilfa::ext_src_dir'          => '/var/nfsshare/KLO_DVD-201605101532-61311',
        'tivolilfa::prereqs'              => [ 'ksh','libstdc++.x86_64','libstdc++.i686','compat-libstdc++-33',
  'compat-libstdc++-33-3.2.3-72.el7.i686','libgcc.i686']}
    }
    default: {
      fail ("${facts['operatingsystem']} is not supported!")
    }
  }
  #$os_params
}

