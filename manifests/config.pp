# Tivoli Logfile agent config class, configures a base instance,
# starts the agent then attempts to umount the share.
class tivolilfa::config(
  String $itm_home      = $::tivolilfa::itm_home,
  String $mount_point   = $::tivolilfa::mount_point,
  String $silent_config = $::tivolilfa::silent_config,
  String $lfa_instance  = $::tivolilfa::lfa_instance,
  String $extsrcdir     = $::tivolilfa::ext_src_dir,
  String $srcdir        = $::tivolilfa::source_dir,
) {

  exec { 'instance_cfg':
    path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
    command => "/opt/IBM/ITM/bin/itmcmd config -A -h ${itm_home} -p /tmp/${silent_config} -o ${lfa_instance} lo",
    unless  => "test -f ${itm_home}/config/lo_${lfa_instance}.config",
  }

  exec { "/opt/IBM/ITM/bin/itmcmd agent -o ${lfa_instance} start lo":
    path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
    unless  => 'ps -ed |grep kloagent',
    require => Exec['instance_cfg'],
  }

  mount { 'umount_nfs':
    ensure  => unmounted,
    name    => $srcdir,
    device  => $mount_point,
    fstype  => 'nfs',
    require => Exec['mount_nfs'],
  }
}

