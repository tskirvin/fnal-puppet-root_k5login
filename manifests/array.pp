# root_k5login::array
#
#   Provide hooks to decide which groups of users should have access to the
#   root k5login.  Wraps root_k5login.
#
# == Parameters
#
#   base        Should we load users from the simple 'root_users' array?
#   cms         Should we load users from the 'root_users_cms' array? 
#   dcso        Should we load users from 'root_users_dcso'?
#   ecf         Should we load users from 'root_users_ecf'?
#   networking  Should we load users from 'root_users_networking'?
#   usdc        Should we load users from 'root_users_usdc'?
#
class root_k5login::array (
  $base       = true,
  $cms        = true,
  $dcso       = true,
  $ecf        = true,
  $networking = true,
  $usdc       = false
) {
  validate_bool($base, $cms, $dcso, $ecf, $networking, $usdc)

  if $base       { $users_base       = hiera_array('root_users', []) }
  else           { $users_base       = [] }

  if $cms        { $users_cms        = hiera_array('root_users_cms', []) }
  else           { $users_cms        = [] }

  if $dcso       { $users_dcso       = hiera_array('root_users_dcso', []) }
  else           { $users_dcso       = [] }

  if $ecf        { $users_ecf        = hiera_array('root_users_ecf', []) }
  else           { $users_ecf        = [] }

  # lint:ignore:80chars
  if $networking { $users_networking = hiera_array('root_users_networking', []) }
  # lint:endignore
  else           { $users_networking = [] }

  if $usdc       { $users_usdc       = hiera_array('root_users_usdc', []) }
  else           { $users_usdc       = [] }

  $users = concat ($users_base, $users_cms, $users_dcso, $users_ecf,
    $users_networking, $users_usdc)

  class { 'root_k5login': users => $users }
}
