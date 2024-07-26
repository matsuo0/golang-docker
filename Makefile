up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
remake:
	@make destroy
	@make init
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker-compose down --volumes --remove-orphans
ps:
	docker-compose ps
logs:
	docker-compose logs
logs-watch:
	docker-compose logs --follow
log-web:
	docker-compose logs web
log-web-watch:
	docker-compose logs --follow web
log-app:
	docker-compose logs go-api-server
log-app-watch:
	docker-compose logs --follow app
log-db:
	docker-compose logs api_db_postgresql
log-db-watch:
	docker-compose logs --follow api_db_postgresql
web:
	docker-compose exec web bash
go:
	docker-compose exec go-api-server bash
npm:
	@make npm-install
npm-install:
	docker-compose exec go-api-server npm install
npm-dev:
	docker-compose exec go-api-server npm run dev
npm-watch:
	docker-compose exec go-api-server npm run watch
npm-watch-poll:
	docker-compose exec go-api-server npm run watch-poll
npm-hot:
	docker-compose exec go-api-server npm run hot
yarn:
	docker-compose exec go-api-server yarn
yarn-install:
	@make yarn
yarn-dev:
	docker-compose exec go-api-server yarn dev
yarn-watch:
	docker-compose exec go-api-server yarn watch
yarn-watch-poll:
	docker-compose exec go-api-server yarn watch-poll
yarn-hot:
	docker-compose exec go-api-server yarn hot
db:
	docker-compose exec api_db_postgresql bash
sql:
	docker-compose exec api_db_postgresql bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'
redis:
	docker-compose exec redis redis-cli
pint:
	docker-compose exec -T app ./vendor/bin/pint
pint-change:
	bash pint.sh
phpstan-analyse:
	docker-compose exec -T app ./vendor/bin/phpstan analyse
phpstan-analyse-baseline:
	docker-compose exec -T app ./vendor/bin/phpstan analyse --generate-baseline