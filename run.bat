REM Running Docker Mota Project Backend

echo Running Mota API server
docker exec -d mota-sb /bin/sh -c "mvn spring-boot:run"

echo Running Mota Executor server
docker exec -d mota-executor /bin/sh -c "mvn spring-boot:run"

echo Running Mota Frontend
docker exec -it ng-mota /bin/sh -c "npm i & npx nx run ng-mota:serve:development --configuration=development --servePath=/m6/ --host 0.0.0.0"