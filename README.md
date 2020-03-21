# rrshare
人人影视客户端
sudo docker run --restart always \
--detach --name rrshareweb -it \
--user \`id -u\`:\`id -g\` \
--volume /home/user/data/rrshare:/mnt/conf \
--volume /home/user/Downloads:/opt/work/store \
--publish 3001:3001 --publish 6714:6714 \
--publish 30210:30210 lll9p/rrshare
