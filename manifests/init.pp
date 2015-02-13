# root_k5login
#
#   Manage /root/.k5login to allow access by our root users; only entries
#   passed in via this array will be in this file. ssh::fermi will take care
#   of setting up the rest of ssh.  The root users are in hiera; look at
#   hieradata/common.yaml .
#
# == Parameters
#
#   file    k5login file to update; defaults to /root/.k5login
#   users   array of users to add to this file; defaults to come from
#           hiera_array('root_users')
#
# == Usage
#
#   class { 'krb5::rootusers': users => [ 'foo@baz.com', 'bar@baz.com' ] }
#
class root_k5login (
  $file  = '/root/.k5login',
  $users = hiera_array('root_users', [])
) {
  validate_array ($users)
  k5login { $file: principals => $users, purge => true }
}
