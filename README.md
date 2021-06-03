# nginxProxyGitDeploy
Run a git server with nginx-proxy to automaticaly deploy compose project when you push


On ne peux pas faire ça car ssh-keygen remplace le fichier au lieu de le modifier et ça fait ressource busy
- ${PWD}/ssh_host_rsa_key.pub:/etc/ssh/ssh_host_rsa_key.pub:rw
You must do this because the file is replaced when you use 'ssh-keygen'

the ssh key change when you rebuild the container, you need to remove it from the know-host file of your computer

done
-secure shh (disable password auth) : OK
-test public key : ok
-git server : ok
-git hook : ok

todo
-git submodules