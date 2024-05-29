REM Running Docker installation script for Mota project

:: Check if Docker is installed

@docker --version

@if %ERRORLEVEL% EQU 0 (
    echo Docker is already installed
) else (
    echo Docker is not installed
    echo Please install Docker before running this script!
    exit /b
)

:: Check if Docker is running

@docker ps -a

@if %ERRORLEVEL% EQU 0 (
    echo Docker is running
) else (
    echo Docker is not running
    echo Please start Docker before running this script!
    exit /b
)

:: Run Docker Install Container

@docker run -it --rm ^
-v "%cd%":/usr/config ^
-v mota-backend_gcloud-config:/root/.config ^
-v mota-backend_maven-repo:/root/.m2 ^
-v mota-backend_mota-source:/home/mota ^
-v "%cd%/mota-docker":/home/mota/mota-docker ^
-w /usr/config ^
gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine ^
/bin/bash install.sh

echo Buliding Docker Image
echo Please wait...

:: Build Docker Image
cd mota-docker/docker-backend/setup

@docker build -t mota-docker-dev .

@docker run -it --rm ^
-v mota-backend_gcloud-config:/root/.config ^
-v mota-backend_maven-repo:/root/.m2 ^
-v mota-backend_mota-source:/home/mota ^
mota-docker-dev

cd ..

docker compose up
