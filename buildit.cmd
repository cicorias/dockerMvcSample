setlocal

set path=%path%;C:\Program Files\7-Zip

docker build -t cicorias/dockermvcsample2:v0.2 .
docker build -t cicorias/dockermvcsample2:latest .


endlocal