##./kubeconf_create.sh cd token_file
# kubectl create token cd -n homework --duration=24h > token
#TOKEN=$(kubectl create token $1 -n homework --duration=24h)   # создаёт временный токен на 1 день
TOKEN=$(cat $2)
#echo $TOKEN
kubectl config view --raw --minify -o json | jq --arg token "$TOKEN" '.users[0].user.token=$token' > cd-kubeconfig_2