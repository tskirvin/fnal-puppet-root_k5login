# fnal-puppet-root_k5login

This repository provides the tools by which we can manage the root
~/.k5login file.

## Classes

### root_k5login

Actually manages the root k5login file (using the k5login type).  Data is
passed in via hiera using the 'root\_users' array.

Parameters:

    file    Default: /root/.k5login
    users   array of users to add to this file; defaults to come from
            hiera_array('root_users')
