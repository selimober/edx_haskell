# edX Haskell Course Environment

This is my vagrant/puppet setup for the [Haskell course](https://courses.edx.org/courses/DelftX/FP101x/3T2014/courseware) in edX by Erik Meijer

It's by definition an opinionated setup:

* Vim as an editor
* Vundle to manage Vim plugins
* Zsh as shell
* ~~Prezto~~ ohmyzsh for instantly awesome and fast Zsh
  - Couldn't find an easy way to install prezto module since it's not puplished in puppet forge. Will switch to prezto as soon as I can.

## Setup

Install git and vagrant for your os.

Clone the repository:

    git clone https://github.com/selimober/edx_haskell

Launch the VM:

    cd edx_haskell
    vagrant up

Ssh into it:

    vagrant ssh

Run byobou:

    byobou

Done.

