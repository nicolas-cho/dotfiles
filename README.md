# Dotfiles

Dotfiles are a collection of configuration files that are used to setup easily user preferred setup.

git bare repository does 


## create Dotfiles from scratch:
1) create repository on GITHUB
2) clone repository
3) add bare repository to that repository
```git init --bare $HOME/dotfiles```
4) add configurations (config is the new "git" command for this repository)
```
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```

test:
```
> config status
nothing to commit, working directory clean
```
optionally add to a repository in github:
```
config config --global user.name "FIRST_NAME LAST_NAME"
config config --global user.email "MY_NAME@example.com"
```


