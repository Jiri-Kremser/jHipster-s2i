IMAGE_NAME = jhipster-centos7

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: squash
squash:
	docker-squash -t $(IMAGE_NAME)-squashed $(IMAGE_NAME)

.PHONY: push
push: squash
	docker tag $(IMAGE_NAME)-squashed jkremser/$(IMAGE_NAME)
	docker push jkremser/$(IMAGE_NAME)

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
