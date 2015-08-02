tips
=======

### Scripts shebang

In all bash script use the following shebang:
```
#!/usr/bin/env bash
```
because it helps for portability [http://stackoverflow.com/questions/10376206/preferred-bash-shebang](http://stackoverflow.com/questions/10376206/preferred-bash-shebang)

### Scripts file extension

For scripts, it is preferred to use .sh or .rb extensions so it is easier to batch manipulate them later
[http://superuser.com/questions/344093/should-i-put-sh-and-rb-file-extensions-on-all-my-scripts](http://superuser.com/questions/344093/should-i-put-sh-and-rb-file-extensions-on-all-my-scripts)

### Checking the version of Tmux in a tmux.conf

```
# Use "if-shell" to run a bash command
# and check the version string of tmux
if-shell "[[ `tmux -V` == *1.9 ]]" 'command-to-be-run-here'
```

taken from [https://coderwall.com/p/tjo3ig](https://coderwall.com/p/tjo3ig)