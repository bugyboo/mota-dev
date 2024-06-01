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

@docker volume create mota-backend_gcloud-config
@docker volume create mota-backend_maven-repo
@docker volume create mota-backend_mota-source
@docker volume create mota-backend_mota-mssql
@docker volume create mota-backend_mota-upload
@docker volume create vscode-java-extension
@docker volume create vscode-java-extension-cache
@docker volume create vscode-node-extension
@docker volume create vscode-node-extension-cache
@docker volume create vscode-dotnet-extension
@docker volume create vscode-dotnet-extension-cache

@echo Buliding Docker Images
@echo Please wait...

:: Build Docker Image
@docker build -t mota-docker-builder .

:: Run Docker Install Container
@docker run -it --rm ^
-v mota-backend_gcloud-config:/root/.config ^
-v mota-backend_maven-repo:/root/.m2 ^
-v mota-backend_mota-source:/home/mota ^
-v "%cd%":/home/builder ^
mota-docker-builder ^
bash -c "cd /home/builder && ./install.sh"

:: Run Docker Containers

@echo Running Docker Compose
@echo Please wait...

cd mota-docker/docker-backend

@docker compose up

@docker image rm mota-docker-builder
