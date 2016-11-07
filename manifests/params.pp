class tivolilfa::params {

        case $::osfamily {

          'RedHat': {
                  $ksh   = 'ksh'
                  $stdcpp_64_package    = 'libstdc++.x86_64'
                  $stdcpp_32_package    = 'libstdc++.i686'
                  $gcc_32_package       = 'libgcc.i686'
                  $compat_64_libs	= 'compat-libstdc++-33'
                  $compat_32_libs	= 'compat-libstdc++-33-3.2.3-72.el7.i686'
                  $itm_home             = '/opt/IBM/ITM'
                  $lfa_config_template  = 'itm6_lfa_base.conf'
                  $lfa_fmt_template     = 'itm6_lfa_base.fmt'
                  $tmp_dir	        = '/tmp'
                  $source_dir           = '/var/nfsshare'
                  $lfa_tar	        = '6.3.0-TIV-ITM_LFA-FP0001.tar'
                  $tems_server          = 'puppet.localdomain'
                  $silent_install	= 'silent_install.txt'
                  $silent_config	= 'silent_config.txt'
                  $lfa_instance	        = 'BASE'
                  $log_sources	        = '/tmp/test.log,/tmp/tesing.log'
                  $mount_point		= '192.168.38.159:/var/lfaimage'
           }
           default:  { fail('OS ${::operatingsystem is not supported') }
        }
}

