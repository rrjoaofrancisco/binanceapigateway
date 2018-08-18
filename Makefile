PROJECT_NAME := binanceapigateway
PYTHON_VERSION := 3.7.0
VENV_NAME := $(PROJECT_NAME)-$(PYTHON_VERSION)

setup:
	pip install -r requirements.txt

.create-venv:
	pyenv uninstall -f $(VENV_NAME)
	pyenv virtualenv $(PYTHON_VERSION) $(VENV_NAME)
	pyenv local $(VENV_NAME)

create-venv: .create-venv setup