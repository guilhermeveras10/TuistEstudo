.DEFAULT_GOAL := install
.PHONY: install install-tuist install-mise configure-shell bootstrap

PWD_ABS := $(shell pwd)
TUIST_VERSION ?= 4.106.3
TUIST_BIN ?= $(HOME)/.local/share/mise/installs/tuist/$(TUIST_VERSION)/bin/tuist
TUIST_HOME_ROOT ?= $(PWD_ABS)/.tuist-home
TUIST_TMP_DIR ?= $(PWD_ABS)/.tuist-tmp
TUIST_MODULE_CACHE_DIR ?= $(TUIST_HOME_ROOT)/.cache/clang/ModuleCache
TUIST_DERIVED_DATA ?= $(TUIST_HOME_ROOT)/DerivedData
TUIST_PROJECT_DIR ?= $(PWD_ABS)/Bolsa De Horas
TUIST_PROJECT_NAME ?= Bolsa De Horas
TUIST_XCODEPROJ := $(TUIST_PROJECT_DIR)/$(TUIST_PROJECT_NAME).xcodeproj
TUIST_XCWORKSPACE := $(TUIST_PROJECT_DIR)/$(TUIST_PROJECT_NAME).xcworkspace
NEEDLE_BIN ?= $(shell command -v needle 2>/dev/null)
NEEDLE_OUTPUT ?= $(TUIST_PROJECT_DIR)/Modules/Anime/Sources/Presentation/Feature/NeedleGenerated.swift
NEEDLE_SOURCES ?= $(TUIST_PROJECT_DIR)/Modules/Anime/Sources

# Usa diretórios locais para evitar erros de permissão (podem ser sobrescritos externamente).
MISE_CACHE_ROOT ?= $(PWD_ABS)/.mise-cache
MISE_CACHE_DIR ?= $(MISE_CACHE_ROOT)
XDG_CACHE_HOME ?= $(MISE_CACHE_DIR)
MISE_STATE_ROOT ?= $(PWD_ABS)/.mise-state
MISE_STATE_DIR ?= $(MISE_STATE_ROOT)
XDG_STATE_HOME ?= $(MISE_STATE_DIR)
export MISE_CACHE_DIR := $(MISE_CACHE_DIR)
export XDG_CACHE_HOME := $(XDG_CACHE_HOME)
export MISE_STATE_DIR := $(MISE_STATE_DIR)
export XDG_STATE_HOME := $(XDG_STATE_HOME)

MISE_ENV := env MISE_CACHE_DIR="$(MISE_CACHE_DIR)" XDG_CACHE_HOME="$(XDG_CACHE_HOME)" MISE_STATE_DIR="$(MISE_STATE_DIR)" XDG_STATE_HOME="$(XDG_STATE_HOME)"

# Configura toda a stack com um único comando: `make install`.
install: configure-shell install-tuist
	@echo "Ambiente configurado com Tuist via mise."

# Garante que o shell do usuário carregue o mise automaticamente.
configure-shell:
	@set -e; \
	ZSHRC_FILE="$(HOME)/.zshrc"; \
	if [ ! -f "$$ZSHRC_FILE" ]; then \
		touch "$$ZSHRC_FILE"; \
	fi; \
	if ! grep -Fxq 'eval "$$(mise activate zsh)"' "$$ZSHRC_FILE" 2>/dev/null; then \
		echo 'eval "$$(mise activate zsh)"' >> "$$ZSHRC_FILE"; \
		echo "Adicionando 'eval \"\$$\(mise activate zsh\)\"' ao $$ZSHRC_FILE"; \
	else \
		echo "'eval \"\$$\(mise activate zsh\)\"' já está presente em $$ZSHRC_FILE"; \
	fi; \
	if ! grep -Fxq 'export PATH="$$(HOME)/.local/share/mise/shims:$${PATH}"' "$$ZSHRC_FILE" 2>/dev/null; then \
		echo 'export PATH="$$(HOME)/.local/share/mise/shims:$${PATH}"' >> "$$ZSHRC_FILE"; \
		echo "Adicionando export PATH ... ao $$ZSHRC_FILE"; \
	else \
		echo 'Linha export PATH "$$(HOME)/.local/share/mise/shims:$${PATH}" já está presente em' $$ZSHRC_FILE; \
	fi

.PHONY: new-module
# Usage: make new-module name=HomeModule
new-module:
	@if [ -z "$(strip $(name))" ]; then \
		echo "❌ Você deve informar o nome do módulo. Ex: make new-module name=Home"; \
		exit 1; \
	fi
	@TEMPLATE_DIR="$(TUIST_PROJECT_DIR)/Templates/Module"; \
	LIBS_ROOT="$(TUIST_PROJECT_DIR)/Targets/Libs"; \
	DEST_DIR="$$LIBS_ROOT/$(name)"; \
	if [ ! -d "$$TEMPLATE_DIR" ]; then \
		echo "❌ Template padrão não encontrado em $$TEMPLATE_DIR."; \
		exit 1; \
	fi; \
	mkdir -p "$$LIBS_ROOT"; \
	if [ -e "$$DEST_DIR" ]; then \
		echo "❌ Já existe um diretório em $$DEST_DIR."; \
		exit 1; \
	fi; \
	cp -R "$$TEMPLATE_DIR" "$$DEST_DIR"; \
	if ! python3 scripts/create_module.py "$$DEST_DIR" "$(name)"; then \
		rm -rf "$$DEST_DIR"; \
		exit 1; \
	fi; \
	if [ ! -x "$(TUIST_BIN)" ]; then \
		echo "⚠️  Tuist não encontrado em $(TUIST_BIN). Rode 'make install' e gere o projeto manualmente."; \
	else \
		echo "🔄 Atualizando o projeto com Tuist..."; \
		if ! SWIFT_OVERLOAD_PREBUILT_MODULE_CACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" SWIFT_MODULECACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" SWIFT_MODULE_CACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" CLANG_MODULE_CACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" MODULE_CACHE_DIR="$(TUIST_MODULE_CACHE_DIR)" DERIVED_DATA_PATH="$(TUIST_DERIVED_DATA)" $(MISE_ENV) HOME="$(TUIST_HOME_ROOT)" TMPDIR="$(TUIST_TMP_DIR)" "$(TUIST_BIN)" generate --path "$(TUIST_PROJECT_DIR)" >/dev/null; then \
			echo "⚠️  Não consegui rodar o Tuist automaticamente. Rode 'tuist generate --path \"$(TUIST_PROJECT_DIR)\"' assim que possível."; \
		fi; \
	fi
	@echo "✅ Módulo $(name) criado em $(TUIST_PROJECT_DIR)/Targets/Libs/$(name)"

.PHONY: module
# Usage: make module name=Home
module:
	@if [ -z "$(strip $(name))" ]; then \
		echo "❌ Você deve informar o nome do módulo. Ex: make module name=Home"; \
		exit 1; \
	fi
	@TEMPLATE_PATH="$(TUIST_PROJECT_DIR)/Tuist/Templates/Clean/Clean.swift"; \
	if [ ! -f "$$TEMPLATE_PATH" ]; then \
		echo "❌ Template Clean não encontrado em $$TEMPLATE_PATH."; \
		exit 1; \
	fi; \
	if [ ! -x "$(TUIST_BIN)" ]; then \
		echo "❌ Tuist não encontrado em $(TUIST_BIN). Rode 'make install' e tente novamente."; \
		exit 1; \
	fi; \
	echo "🔧 Gerando módulo Clean '$(name)'..."; \
	mkdir -p "$(TUIST_PROJECT_DIR)/Modules"; \
	if ! SWIFT_OVERLOAD_PREBUILT_MODULE_CACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" SWIFT_MODULECACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" SWIFT_MODULECACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" CLANG_MODULE_CACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" MODULE_CACHE_DIR="$(TUIST_MODULE_CACHE_DIR)" DERIVED_DATA_PATH="$(TUIST_DERIVED_DATA)" $(MISE_ENV) HOME="$(TUIST_HOME_ROOT)" TMPDIR="$(TUIST_TMP_DIR)" "$(TUIST_BIN)" scaffold Clean --path "$(TUIST_PROJECT_DIR)" --name "$(name)"; then \
		echo "⚠️  Não foi possível gerar o módulo Clean automaticamente. Verifique o Tuist e tente novamente."; \
		exit 1; \
	fi; \
	echo "✅ Módulo Clean '$(name)' criado em $(TUIST_PROJECT_DIR)/Modules/$(name)"

.PHONY: needle-generate
# Usage: make needle-generate [NEEDLE_OUTPUT=...] [NEEDLE_SOURCES=...]
needle-generate:
	@if [ -z "$(strip $(NEEDLE_BIN))" ]; then \
		echo "❌ needle CLI não encontrado. Instale com 'brew install needle' ou defina NEEDLE_BIN com o caminho do binário."; \
		exit 1; \
	fi
	@echo "🔧 Gerando arquivo do Needle em $(NEEDLE_OUTPUT)..."
	@mkdir -p "$(dir $(NEEDLE_OUTPUT))"
	@"$(NEEDLE_BIN)" generate "$(NEEDLE_OUTPUT)" "$(NEEDLE_SOURCES)"
	@echo "✅ NeedleGenerated atualizado."

# Garante que o mise esteja instalado. Faz uso do Homebrew, se necessário.
install-mise:
	@if command -v mise >/dev/null 2>&1; then \
		echo "mise já está instalado."; \
	else \
		echo "mise não encontrado. Instalando via Homebrew..."; \
		if command -v brew >/dev/null 2>&1; then \
			brew install mise; \
		else \
			echo "Homebrew não encontrado. Instale-o para continuar." >&2; \
			exit 1; \
		fi; \
	fi

# Instala o Tuist utilizando o mise (plugins + versão mais recente).
install-tuist: install-mise
	@set -e; \
	mkdir -p "$(MISE_CACHE_DIR)" "$(XDG_CACHE_HOME)/mise" "$(MISE_STATE_DIR)" "$(XDG_STATE_HOME)/mise"; \
	if [ -f "mise.toml" ]; then \
		$(MISE_ENV) mise trust . >/dev/null 2>&1 || true; \
	fi; \
	if ! $(MISE_ENV) mise plugins ls | grep -Eq '^tuist(\s|$$)'; then \
		echo "Instalando plugin do Tuist no mise..."; \
		$(MISE_ENV) mise plugins install tuist https://github.com/tuist/asdf-tuist.git; \
	else \
		echo "Plugin do Tuist já está instalado no mise."; \
	fi; \
	if $(MISE_ENV) mise which tuist 2>/dev/null | grep -q "$(TUIST_VERSION)"; then \
		echo "Tuist $(TUIST_VERSION) já está instalado via mise."; \
	else \
		echo "Instalando Tuist $(TUIST_VERSION) com mise..."; \
		$(MISE_ENV) mise install "tuist@$(TUIST_VERSION)"; \
	fi; \
	echo "Definindo o Tuist como versão global no mise..."; \
	if ! $(MISE_ENV) mise use -g "tuist@$(TUIST_VERSION)" >/dev/null 2>&1; then \
		echo "Sem permissão para atualizar a configuração global, registrando no projeto..."; \
		$(MISE_ENV) mise use "tuist@$(TUIST_VERSION)"; \
	fi; \
	if [ -f "mise.toml" ]; then \
		$(MISE_ENV) mise trust . >/dev/null 2>&1 || true; \
	fi; \
	$(MISE_ENV) mise reshim >/dev/null 2>&1 || true; \
	echo "Tuist pronto para uso."

# Gera o projeto com Tuist após garantir as dependências instaladas.
bootstrap: install
	@mkdir -p "$(TUIST_MODULE_CACHE_DIR)" "$(TUIST_HOME_ROOT)/.tuist/Cache/Plugins" "$(TUIST_TMP_DIR)" "$(TUIST_DERIVED_DATA)"; \
	echo "Gerando projeto com Tuist..."; \
	if [ ! -x "$(TUIST_BIN)" ]; then \
		echo "Tuist não encontrado em $(TUIST_BIN). Rode 'make install' e tente novamente." >&2; \
		exit 1; \
	fi; \
	SWIFT_OVERLOAD_PREBUILT_MODULE_CACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" SWIFT_MODULECACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" SWIFT_MODULE_CACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" CLANG_MODULE_CACHE_PATH="$(TUIST_MODULE_CACHE_DIR)" MODULE_CACHE_DIR="$(TUIST_MODULE_CACHE_DIR)" DERIVED_DATA_PATH="$(TUIST_DERIVED_DATA)" $(MISE_ENV) HOME="$(TUIST_HOME_ROOT)" TMPDIR="$(TUIST_TMP_DIR)" "$(TUIST_BIN)" generate --path "$(TUIST_PROJECT_DIR)"; \
	OPEN_PATH=""; \
	if [ -d "$(TUIST_XCWORKSPACE)" ]; then \
		OPEN_PATH="$(TUIST_XCWORKSPACE)"; \
	elif [ -d "$(TUIST_XCODEPROJ)" ]; then \
		OPEN_PATH="$(TUIST_XCODEPROJ)"; \
	else \
		echo "Não encontrei um .xcworkspace ou .xcodeproj para abrir." >&2; \
		exit 1; \
	fi; \
	echo "Encerrando instâncias existentes do Xcode..."; \
	killall Xcode >/dev/null 2>&1 || true; \
	echo "Abrindo Xcode em $$OPEN_PATH"; \
	open -a Xcode "$$OPEN_PATH"
