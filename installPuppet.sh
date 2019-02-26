#!/bin/bash -e

## Install Git and Puppet
rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum -y install git-core puppet-agent

# Clone the 'puppet' repo
cd /etc/puppetlabs
git init
git remote add origin https://github.com/scuthbert/4113Puppet.git
git fetch
git checkout origin/master -ft

# Run Puppet initially to set up the auto-deploy mechanism
/opt/puppetlabs/bin/puppet module install saz-sudo --version 6.0.0
/opt/puppetlabs/bin/puppet module install huit-pam_access --version 0.1.0
/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/puppet/manifests/site.pp
