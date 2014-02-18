# Safe PostgreSQL dumps, as part of a backupninja run.
#
define backupninja::pgsql (
  $order      = 10,
  $ensure     = present,
  $backupdir  = false,
  $databases  = 'all',
  $compress   = 'yes',
  $vsname     = false,
) {

  include backupninja::client::defaults
  file { "${backupninja::client::defaults::configdir}/${order}_${name}.pgsql":
    ensure  => $ensure,
    content => template('backupninja/pgsql.conf.erb'),
    owner   => root,
    group   => root,
    mode    => '0600',
    require => File[$backupninja::client::defaults::configdir],
  }
}
