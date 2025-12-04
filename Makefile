.ONESHELL:
SHELL := /bin/bash

TUIST_VERSION      := 4.106.3
TUIST_TEMPLATE     := TemplateV2
PROJECT_DIR        := Bolsa De Horas

NEEDLE_CLI         := needle
NEEDLE_SOURCES_DIR := $(PROJECT_DIR)/Modules
ACTION_IDENTIFIER  := $(PROJECT_DIR)/Modules/Utility/Sources/Classes/Enum/ActionIdentifier.swift

.PHONY: install new-module bootstrap _needle-generate-module

##
## make install
## - Instala NeedleFoundation (CLI), mise e Tuist 4.106.3
##
install:
	@echo "➡️ Instalando NeedleFoundation (CLI) via Homebrew..."
	brew install needle
	@echo "➡️ Instalando mise via Homebrew..."
	brew install mise
	@echo "➡️ Instalando Tuist $(TUIST_VERSION) via mise..."
	mise install tuist@$(TUIST_VERSION)
	mise use -g tuist@$(TUIST_VERSION)
	@echo "✅ Dependências instaladas."

##
## make new-module module=Anime action=action-anime
## - Cria um novo módulo usando o template existente
## - Cria também a action
## - Roda needle generate pro módulo específico
##
new-module: install
	@if [ -z "$(module)" ]; then \
		echo "❌ Faltou o parâmetro 'module'"; \
		echo "   Exemplo: make new-module module=Anime action=action-anime"; \
		exit 1; \
	fi
	@if [ -z "$(action)" ]; then \
		echo "❌ Faltou o parâmetro 'action'"; \
		echo "   Exemplo: make new-module module=Anime action=action-anime"; \
		exit 1; \
	fi
	@echo "➡️ Gerando módulo '$(module)' com template '$(TUIST_TEMPLATE)'..."
	tuist scaffold $(TUIST_TEMPLATE) \
		--name "$(module)" \
		--action "$(action)" \
		--path "$(PROJECT_DIR)"
	@echo "➡️ Registrando action '$(action)' em $(ACTION_IDENTIFIER)..."
	@python3 -c "import sys, pathlib; module, action, path = sys.argv[1:4]; case_name = f'action{module}'; comment = f'    /// {action}'; line = f'    case {case_name} = \"{action}\"'; p = pathlib.Path(path); lines = p.read_text(encoding='utf-8').splitlines(); import sys as _s; insert_at = next((i for i, l in enumerate(lines) if l.strip() == '}'), None); _s.exit(0) if any(case_name in l or action in l for l in lines) else None; _s.exit(\"Não encontrei '}' para inserir a action.\") if insert_at is None else None; new_lines = lines[:insert_at] + [comment, line] + lines[insert_at:]; p.write_text('\\n'.join(new_lines) + '\\n', encoding='utf-8')" "$(module)" "$(action)" "$(ACTION_IDENTIFIER)"
	@echo "➡️ Adicionando targets '$(module)' e '$(module)Demo' ao projeto raiz..."
	@python3 -c "from pathlib import Path; import sys; module='$(module)'; project_path=Path('Bolsa De Horas/Project.swift'); \
import sys as _s; \
(_s.exit('Bolsa De Horas/Project.swift não encontrado.') if not project_path.exists() else None); \
text=project_path.read_text(encoding='utf-8'); \
(_s.exit(0) if f'name: \"{module}\"' in text else None); \
snippet=f'''        .target(\
            name: \"{module}\",\
            destinations: .iOS,\
            product: .framework,\
            bundleId: \"dev.tuist.{module}\",\
            infoPlist: .default,\
            sources: [\"Modules/{module}/Sources/**\"],\
            dependencies: [\
                .package(product: \"Alamofire\"),\
                .package(product: \"NeedleFoundation\"),\
                .target(name: \"Utility\")\
            ]\
        ),\
        .target(\
            name: \"{module}Demo\",\
            destinations: .iOS,\
            product: .app,\
            bundleId: \"dev.tuist.{module}Demo\",\
            infoPlist: .default,\
            sources: [\"Modules/{module}/Demo/**\"],\
            dependencies: [\
                .target(name: \"{module}\")\
            ]\
        ),\
'''; \
marker='        .target(\\n            name: \"Bolsa De Horas\",'; \
idx=text.find(marker); \
idx=text.rfind('    ]') if idx==-1 else idx; \
(_s.exit('Não encontrei posição para inserir os targets.') if idx==-1 else None); \
new_text=text[:idx]+snippet+('\\n'+text[idx:] if idx!=-1 else ''); \
project_path.write_text(new_text, encoding='utf-8')" 
	@echo "➡️ Rodando Needle para o módulo '$(module)'..."
	$(MAKE) _needle-generate-module module=$(module)
	@echo "✅ Módulo '$(module)' criado com action '$(action)', targets no projeto raiz e Needle gerado."

##
## Alvo interno para rodar o needle generate só do módulo informado
##
_needle-generate-module:
	@if [ -z "$(module)" ]; then \
		echo "❌ _needle-generate-module requer 'module' (ex: module=Anime)"; \
		exit 1; \
	fi
	@OUT="$(PROJECT_DIR)/Modules/$(module)/Sources/NeedleGenerated.swift"; \
	SRC="$(NEEDLE_SOURCES_DIR)/$(module)/Sources"; \
	mkdir -p "$$(dirname "$$OUT")"; \
	echo "➡️ Gerando arquivo Needle para '$(module)'..."; \
	$(NEEDLE_CLI) generate "$$OUT" "$$SRC"; \
	echo "✅ Needle gerado em '$$OUT'."

##
## make bootstrap
## - Gera o projeto via Tuist
##
bootstrap: install
	@echo "➡️ Gerando projeto com Tuist..."
	cd "$(PROJECT_DIR)" && tuist generate
	@echo "✅ Projeto gerado com sucesso."
