# nginxProxyGitDeploy
Run a git server with nginx-proxy to automaticaly deploy compose project when you push


On ne peux pas faire ça car ssh-keygen remplace le fichier au lieu de le modifier et ça fait ressource busy
- ${PWD}/ssh_host_rsa_key.pub:/etc/ssh/ssh_host_rsa_key.pub:rw
You must do this because the file is replaced when you use 'ssh-keygen'

todo
-secure shh (disable password auth) OK
-test public key (en cours)
-configure git server
-configure git hook