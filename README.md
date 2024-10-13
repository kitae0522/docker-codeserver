# docker-codeserver
Setup Code Server on Ubuntu (w/Docker, Docker Compose)

## How to use
0. 이 Repository를 Clone하기
```bash
$ git clone https://github.com/kitae0522/docker-codeserver.git
```

1. `docker-compose.yml` 파일 수정
````diff
environment:
-   - PASSWORD=password
+   - PASSWORD=new-password
-   - SUDO_PASSWORD=sudopassword
+   - SUDO-PASSWORD=new-sudopassword
````

2. `docker-compose.yml` 파일을 통해 Code Server를 먼저 실행
```bash
$ docker compose up --build -d
```

3. `{ip/domain}:8443`에 접속하여 Code Server에 접속

4. Code Server에서 `/config/setting.sh` 파일 수정
````diff
environment:
-   GIT_NAME=""
-   GIT_EMAIL=""
+   GIT_NAME="kitae0522"
+   GIT_EMAIL="kitae040522"
-   GO_VERSION="1.23.2"
-   DOCKER_COMPOSE_VERSION="v2.29.7"
+   GO_VERSION="1.20.5"
+   DOCKER_COMPOSE_VERSION="v1.29.2"
````

5. Code Server의 Terminal에서 `/config/setting.sh`을 실행
```bash
$ chmod 755 /config/setting.sh
$ sh /config/setting.sh
```
