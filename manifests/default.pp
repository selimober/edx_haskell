exec { "set local":
  command => "echo 'LC_ALL=\"en_US.UTF-8\"' >> /etc/environment",
  path => "/bin"
}

# Update apt before installing any packages

exec { "apt-update":
  command => "/usr/bin/apt-get update",
  require => Exec["set local"]
}

class { 'ohmyzsh': }
ohmyzsh::install { 'vagrant': } ->
ohmyzsh::theme { 'vagrant': theme => 'robbyrussell' } ->
ohmyzsh::plugins { 'vagrant': plugins => 'git' } ->
ohmyzsh::upgrade { 'vagrant': } ->
package { 'haskell-platform':
    ensure => 'latest',
} ->

exec { "vim":
  command => "/usr/bin/git clone https://github.com/selimober/dotfiles.git",
  require => Package['haskell-platform'],
  user => 'vagrant'
} ->

exec { "vundle":
  command => "/usr/bin/git clone https://github.com/gmarik/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim",
  require => Package['haskell-platform'],
  user => 'vagrant'
} ->

exec { "dotfiles":
  command => "/bin/cp -r /home/vagrant/dotfiles/vim/. /home/vagrant",
  require => Exec["vim"],
  user => 'vagrant'
}

class { 'stdlib': }

exec { "install vim plugins":
  environment => ["HOME=/home/vagrant"],
  command => "/usr/bin/vim +PluginInstall +qall",
  require => Exec['dotfiles'],
  user => 'vagrant'
}
