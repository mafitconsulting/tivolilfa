class tivolilfa::install  ( ) inherits tivolilfa { 

          exec { "mount_share":
	     path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/bin",
	     command   => "mount -t nfs $mount_point $source_dir",
             unless    => "test -f $itm_home/bin/cinfo",
          }
             

          exec { "tar xf $lfa_tar":
             cwd       => "$source_dir",
             path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
	     timeout   => 1800,	
             unless    => "test -f $itm_home/bin/cinfo",
          }

          $ext_source_dir = "${source_dir}/KLO_DVD-201605101532-61311"

          exec { "/bin/ksh install.sh -h $itm_home -p /tmp/$silent_install":
             cwd       => "$ext_source_dir",
             path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
             unless    => "test -f $itm_home/bin/cinfo",
          }

	  exec { "/opt/IBM/ITM/bin/itmcmd config -A -h $itm_home -p /tmp/$silent_config -o $lfa_instance lo":
             cwd       => "$ext_source_dir",
             path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
             unless    => "test -f $itm_home/config/lo_${lfa_instance}.config",

          }

          exec { "/opt/IBM/ITM/bin/itmcmd agent -o $lfa_instance start lo":
             cwd       => "$ext_source_dir",
             path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
             unless    => "ps -ed |grep kloagent",

          }

          exec {"umount_nfsshare": 
	     path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/bin",
             command   => "umount $source_dir",
             onlyif    => "test -f $source_dir",
             logoutput => "true",
          }

}
	
