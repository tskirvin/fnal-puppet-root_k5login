$principals = [ 'service/testing@FNAL.GOV', 'service/testing2@FNAL.GOV' ]

k5login_manage { '/tmp/k5login': 
  principals => $principals, 
  purge      => true 
}
