


debug: 
	poetry run python -m debugpy --listen localhost:5678 --wait-for-client -m src.app


build:
	docker build . -t jorgeandrealves/hostapi:latest


push:
	docker login 
	docker push jorgeandrealves/hostapi:latest
