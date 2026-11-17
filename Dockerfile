FROM quay.io/fedora/fedora-bootc:45

RUN dnf install docker-compose gcc gcc-c++ git-core glibc-langpack-en vim --assumeyes \
	&& dnf remove nano nano-default-editor --assumeyes \
	&& dnf clean all \
	&& systemd-firstboot --reset --locale en_US.UTF-8 --timezone Asia/Seoul \
	&& systemctl enable docker.service \
	&& rm /etc/skel/.bash_logout \
	&& bootc container lint
