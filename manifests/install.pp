# Install class. Installs all logfile agents pre-reqs,
# mounts filesystem, untars file (if required) and installs agent
class tivolilfa::install(
  String $mount_point    = $::tivolilfa::mount_point,
  String $source_dir     = $::tivolilfa::source_dir,
  String $lfa_tar        = $::tivolilfa::lfa_tar,
  String $ext_src_dir    = $::tivolilfa::ext_src_dir,
  String $itm_home       = $::tivolilfa::itm_home,
  String $silent_install = $::tivolilfa::silent_install,
  Array[String] $prereqs = $::tivolilfa::prereqs,

) {

  package { $prereqs:
    ensure => 'installed',
  }

  file { $source_dir:
    ensure  => directory,
    before  => Exec['untarball'],
    require => Exec['mount_nfs'],
  }

  exec { 'mount_nfs':
    path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/bin',
    command => "mount -t nfs ${mount_point} ${source_dir}",
    unless  => "test -f ${itm_home}/bin/cinfo",
    before  => Exec['untarball'],
  }

  exec { 'untarball':
    cwd     => $source_dir,
    command => "tar xf ${lfa_tar}",
    path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
    timeout => 1800,
    unless  => "test -f ${itm_home}/bin/cinfo",
    creates => $ext_src_dir,
  }

  exec { "/bin/ksh install.sh -h ${itm_home} -p /tmp/${silent_install}":
    cwd    => $ext_src_dir,
    path   => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
    unless => "test -f ${itm_home}/bin/cinfo",
  }
}
