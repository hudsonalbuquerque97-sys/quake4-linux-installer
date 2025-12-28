#!/bin/bash

# Script de Instalação Automática do Quake 4 para Linux Mint 22.1 / Ubuntu 24.04
# Quake 4 Automated Installation Script for Linux Mint 22.1 / Ubuntu 24.04
# Baseado no guia de Lucas Williams (lucaswilliams.net)
# Based on Lucas Williams guide (lucaswilliams.net)
# Data/Date: Dezembro/December 2025

set -e  # Parar em caso de erro / Stop on error

# ============================================================================
# DETECÇÃO DE IDIOMA / LANGUAGE DETECTION
# ============================================================================

detect_language() {
    # Detecta idioma do sistema
    SYSTEM_LANG="${LANG%%.*}"
    SYSTEM_LANG="${SYSTEM_LANG%%_*}"
    
    case "$SYSTEM_LANG" in
        pt|pt_BR|pt_PT)
            SCRIPT_LANG="pt"
            ;;
        *)
            SCRIPT_LANG="en"
            ;;
    esac
}

# Mensagens em Português
MSG_TITLE_PT="INSTALADOR AUTOMÁTICO DO QUAKE 4 PARA LINUX"
MSG_CONTINUE_PT="Deseja continuar? (s/N): "
MSG_CANCEL_PT="Instalação cancelada"
MSG_ROOT_ERROR_PT="NÃO execute este script como root! Use sudo quando necessário."
MSG_COMPAT_CHECK_PT="Verificando compatibilidade do sistema"
MSG_COMPAT_OK_PT="Sistema compatível detectado"
MSG_COMPAT_ERROR_PT="Este script é para sistemas baseados em Debian/Ubuntu (como Mint)"
MSG_FIND_FILES_PT="Localizando arquivos do Quake 4"
MSG_FIND_PROMPT_PT="Forneça o caminho para os arquivos do Quake 4:"
MSG_FIND_OPTIONS_PT="Opções aceitas:"
MSG_FIND_OPT1_PT="  1) Arquivo DEB (quake4-data.deb)"
MSG_FIND_OPT2_PT="  2) Pasta com arquivos .pk4 (C:\\Program Files\\Quake 4\\q4base)"
MSG_FIND_OPT3_PT="  3) Pasta de instalação Wine (~/.wine/drive_c/...)"
MSG_FIND_INPUT_PT="Caminho (ou arraste aqui): "
MSG_NOT_FOUND_PT="Não encontrado:"
MSG_NO_PK4_PT="Nenhum arquivo .pk4 encontrado em:"
MSG_FOUND_PK4_PT="Encontrados {count} arquivos .pk4"
MSG_INSTALL_DEPS_PT="Instalando dependências do sistema"
MSG_ADD_PPA_PT="Adicionando PPA para libxp6..."
MSG_UPDATE_PT="Atualizando lista de pacotes..."
MSG_INSTALL_PKG_PT="Instalando pacotes necessários..."
MSG_DEPS_OK_PT="Dependências instaladas"
MSG_CREATE_DIRS_PT="Criando diretórios de instalação"
MSG_DIR_EXISTS_PT="Diretório já existe"
MSG_OVERWRITE_PT="Deseja sobrescrever? (s/N): "
MSG_DIRS_OK_PT="Diretórios criados"
MSG_COPY_FILES_PT="Copiando arquivos .pk4"
MSG_COPYING_PT="Copiando arquivos (isso pode demorar ~10 minutos)..."
MSG_COPIED_PT="Copiados {count} arquivos .pk4"
MSG_FIND_INSTALLER_PT="Localizando instalador Linux do Quake 4"
MSG_INSTALLER_PROMPT_PT="Forneça o caminho para o instalador Linux:"
MSG_INSTALLER_OPT1_PT="  1) Arquivo 'quake4-linux-1.4.2.x86.run'"
MSG_INSTALLER_OPT2_PT="  2) CD/DVD original com versão Linux"
MSG_INSTALLER_INPUT_PT="Caminho para o instalador: "
MSG_INSTALLER_NOT_FOUND_PT="Instalador não encontrado:"
MSG_INSTALLER_NOT_EXEC_PT="Arquivo não é executável"
MSG_INSTALLER_COPIED_PT="Instalador copiado para diretório temporário"
MSG_INSTALLER_READY_PT="Instalador pronto"
MSG_RUN_INSTALLER_PT="Executando instalador do Quake 4"
MSG_INSTALLER_GUI_PT="O instalador irá abrir uma interface gráfica"
MSG_INSTALLER_PATH_PT="Quando perguntado, use o caminho:"
MSG_PRESS_ENTER_PT="Pressione ENTER quando estiver pronto..."
MSG_INSTALLER_DONE_PT="Instalador concluído"
MSG_FIX_LIBS_PT="Corrigindo bibliotecas incompatíveis"
MSG_LIBS_MOVED_PT="Bibliotecas antigas movidas para temp/"
MSG_CREATE_LINKS_PT="Criando links simbólicos..."
MSG_LINKS_OK_PT="Links simbólicos criados"
MSG_CONFIG_LANG_PT="Configurando idioma"
MSG_LANG_EN_PT="Configurando para inglês..."
MSG_LANG_OK_PT="Idioma configurado para inglês"
MSG_LANG_WARN_PT="Arquivo de configuração não existe ainda (será criado na primeira execução)"
MSG_DESKTOP_PT="Criando atalho no menu"
MSG_DOWNLOAD_ICON_PT="Baixando ícone (tentativa {n}/{total})..."
MSG_ICON_OK_PT="Ícone baixado com sucesso!"
MSG_ICON_FAIL_PT="Não foi possível baixar o ícone, usando ícone padrão"
MSG_DESKTOP_OK_PT="Atalho criado no menu de aplicativos"
MSG_LAUNCHER_PT="Criando script de inicialização"
MSG_LAUNCHER_OK_PT="Comando 'quake4' disponível no terminal"
MSG_CLEANUP_PT="Limpando arquivos temporários"
MSG_CLEANUP_OK_PT="Limpeza concluída"
MSG_TEST_PT="Testando instalação"
MSG_BINARY_OK_PT="Binário principal encontrado"
MSG_BINARY_FAIL_PT="Binário principal NÃO encontrado"
MSG_DATA_OK_PT="Arquivos de dados encontrados ({count} .pk4)"
MSG_DATA_FAIL_PT="Arquivos de dados NÃO encontrados"
MSG_TEST_OK_PT="Instalação parece estar correta!"

# Mensagens em Inglês / Messages in English
MSG_TITLE_EN="QUAKE 4 AUTOMATIC INSTALLER FOR LINUX"
MSG_CONTINUE_EN="Do you want to continue? (y/N): "
MSG_CANCEL_EN="Installation cancelled"
MSG_ROOT_ERROR_EN="DO NOT run this script as root! Use sudo when necessary."
MSG_COMPAT_CHECK_EN="Checking system compatibility"
MSG_COMPAT_OK_EN="Compatible system detected"
MSG_COMPAT_ERROR_EN="This script is for Debian/Ubuntu-based systems (like Mint)"
MSG_FIND_FILES_EN="Locating Quake 4 files"
MSG_FIND_PROMPT_EN="Provide the path to your Quake 4 files:"
MSG_FIND_OPTIONS_EN="Accepted options:"
MSG_FIND_OPT1_EN="  1) DEB file (quake4-data.deb)"
MSG_FIND_OPT2_EN="  2) Folder with .pk4 files (C:\\Program Files\\Quake 4\\q4base)"
MSG_FIND_OPT3_EN="  3) Wine installation folder (~/.wine/drive_c/...)"
MSG_FIND_INPUT_EN="Path (or drag here): "
MSG_NOT_FOUND_EN="Not found:"
MSG_NO_PK4_EN="No .pk4 files found in:"
MSG_FOUND_PK4_EN="Found {count} .pk4 files"
MSG_INSTALL_DEPS_EN="Installing system dependencies"
MSG_ADD_PPA_EN="Adding PPA for libxp6..."
MSG_UPDATE_EN="Updating package list..."
MSG_INSTALL_PKG_EN="Installing required packages..."
MSG_DEPS_OK_EN="Dependencies installed"
MSG_CREATE_DIRS_EN="Creating installation directories"
MSG_DIR_EXISTS_EN="Directory already exists"
MSG_OVERWRITE_EN="Do you want to overwrite? (y/N): "
MSG_DIRS_OK_EN="Directories created"
MSG_COPY_FILES_EN="Copying .pk4 files"
MSG_COPYING_EN="Copying files (this may take ~10 minutes)..."
MSG_COPIED_EN="Copied {count} .pk4 files"
MSG_FIND_INSTALLER_EN="Locating Quake 4 Linux installer"
MSG_INSTALLER_PROMPT_EN="Provide the path to the Linux installer:"
MSG_INSTALLER_OPT1_EN="  1) File 'quake4-linux-1.4.2.x86.run'"
MSG_INSTALLER_OPT2_EN="  2) Original CD/DVD with Linux version"
MSG_INSTALLER_INPUT_EN="Path to installer: "
MSG_INSTALLER_NOT_FOUND_EN="Installer not found:"
MSG_INSTALLER_NOT_EXEC_EN="File is not executable"
MSG_INSTALLER_COPIED_EN="Installer copied to temporary directory"
MSG_INSTALLER_READY_EN="Installer ready"
MSG_RUN_INSTALLER_EN="Running Quake 4 installer"
MSG_INSTALLER_GUI_EN="The installer will open a graphical interface"
MSG_INSTALLER_PATH_EN="When asked, use this path:"
MSG_PRESS_ENTER_EN="Press ENTER when ready..."
MSG_INSTALLER_DONE_EN="Installer completed"
MSG_FIX_LIBS_EN="Fixing incompatible libraries"
MSG_LIBS_MOVED_EN="Old libraries moved to temp/"
MSG_CREATE_LINKS_EN="Creating symbolic links..."
MSG_LINKS_OK_EN="Symbolic links created"
MSG_CONFIG_LANG_EN="Configuring language"
MSG_LANG_EN_EN="Setting to English..."
MSG_LANG_OK_EN="Language configured to English"
MSG_LANG_WARN_EN="Config file doesn't exist yet (will be created on first run)"
MSG_DESKTOP_EN="Creating menu shortcut"
MSG_DOWNLOAD_ICON_EN="Downloading icon (attempt {n}/{total})..."
MSG_ICON_OK_EN="Icon downloaded successfully!"
MSG_ICON_FAIL_EN="Could not download icon, using default icon"
MSG_DESKTOP_OK_EN="Shortcut created in applications menu"
MSG_LAUNCHER_EN="Creating launcher script"
MSG_LAUNCHER_OK_EN="Command 'quake4' available in terminal"
MSG_CLEANUP_EN="Cleaning temporary files"
MSG_CLEANUP_OK_EN="Cleanup completed"
MSG_TEST_EN="Testing installation"
MSG_BINARY_OK_EN="Main binary found"
MSG_BINARY_FAIL_EN="Main binary NOT found"
MSG_DATA_OK_EN="Data files found ({count} .pk4)"
MSG_DATA_FAIL_EN="Data files NOT found"
MSG_TEST_OK_EN="Installation appears to be correct!"

# Função para obter mensagem traduzida / Function to get translated message
msg() {
    local key="$1"
    shift
    local var_name="MSG_${key}_${SCRIPT_LANG^^}"
    local message="${!var_name}"
    
    # Substituir placeholders
    while [[ $# -gt 0 ]]; do
        local placeholder="$1"
        local value="$2"
        message="${message//\{$placeholder\}/$value}"
        shift 2
    done
    
    echo "$message"
}

# Cores para output / Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Sem cor / No color

# Variáveis / Variables
INSTALL_DIR="/usr/local/games/quake4"
TEMP_DIR="$HOME/quake4-install-temp"
QUAKE4_KEY="XXXXXXXXXXXXXXXXXXXXX"


)

# URLs alternativas para o ícone / Alternative URLs for icon
ICON_URLS=(
    "https://cdn2.steamgriddb.com/icon_thumb/9a568a2aa8c19a3155607f84137d92a8.png"
    "https://www.lucaswilliams.net/wp-content/uploads/2025/06/quake4.png"
    "https://upload.wikimedia.org/wikipedia/fr/1/1e/Quake_4_Logo.png"
)

# Funções auxiliares / Helper functions
print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

check_root() {
    if [ "$EUID" -eq 0 ]; then 
        print_error "$(msg ROOT_ERROR)"
        exit 1
    fi
}

check_dependencies() {
    print_header "$(msg COMPAT_CHECK)"
    
    # Verificar se está em uma distro baseada em Debian/Ubuntu
    if ! command -v apt &> /dev/null; then
        print_error "$(msg COMPAT_ERROR)"
        exit 1
    fi
    
    # Verificar se dpkg está disponível
    if ! command -v dpkg &> /dev/null; then
        print_error "$(msg COMPAT_ERROR)"
        exit 1
    fi
    
    print_success "$(msg COMPAT_OK)"
}

find_game_files() {
    print_header "$(msg FIND_FILES)"
    
    # Criar diretório temporário primeiro
    mkdir -p "$TEMP_DIR"
    
    echo "$(msg FIND_PROMPT)"
    echo ""
    echo "$(msg FIND_OPTIONS)"
    echo "$(msg FIND_OPT1)"
    echo "$(msg FIND_OPT2)"
    echo "$(msg FIND_OPT3)"
    echo ""
    read -p "$(msg FIND_INPUT)" GAME_PATH
    
    # Remover aspas se houver
    GAME_PATH=$(echo "$GAME_PATH" | sed "s/'//g" | sed 's/"//g')
    
    # Expandir ~ para $HOME
    GAME_PATH="${GAME_PATH/#\~/$HOME}"
    
    if [ ! -e "$GAME_PATH" ]; then
        print_error "$(msg NOT_FOUND) $GAME_PATH"
        exit 1
    fi
    
    # Determinar tipo de fonte
    if [ -f "$GAME_PATH" ]; then
        # É um arquivo - assumir que é DEB
        SOURCE_TYPE="deb"
        SOURCE_PATH="$GAME_PATH"
        print_success "DEB: $SOURCE_PATH"
    elif [ -d "$GAME_PATH" ]; then
        # É uma pasta - procurar por .pk4
        SOURCE_TYPE="folder"
        SOURCE_PATH="$GAME_PATH"
        
        # Contar arquivos .pk4
        PK4_COUNT=$(find "$SOURCE_PATH" -name "*.pk4" 2>/dev/null | wc -l)
        
        if [ "$PK4_COUNT" -eq 0 ]; then
            print_error "$(msg NO_PK4) $SOURCE_PATH"
            exit 1
        fi
        
        print_success "$(msg FOUND_PK4 count "$PK4_COUNT")"
    fi
}

install_system_dependencies() {
    print_header "$(msg INSTALL_DEPS)"
    
    print_info "$(msg ADD_PPA)"
    sudo add-apt-repository -y ppa:zeehio/libxp
    
    print_info "$(msg UPDATE)"
    sudo apt update --allow-releaseinfo-change 2>&1 | grep -v "404  Not Found" || true
    
    print_info "$(msg INSTALL_PKG)"
    
    # Pacotes básicos sem conflitos
    sudo apt install -y \
        libxp6 \
        libssl-dev \
        libasound2-plugins:i386 \
        libpipewire-0.3-0:i386 \
        firejail \
        wget \
        libsdl1.2debian:i386 \
        lib32gcc-s1 \
        lib32stdc++6 \
        libopenal1:i386 \
        alsa-oss
    
    # Tentar instalar pipewire-alsa OU pulseaudio (nunca os dois)
    if dpkg -l | grep -q "^ii  pulseaudio"; then
        print_info "PulseAudio já instalado, pulando pipewire-alsa (conflito)"
    else
        sudo apt install -y pipewire-alsa:i386 2>/dev/null || {
            print_warning "pipewire-alsa não disponível, instalando PulseAudio"
            sudo apt install -y pulseaudio
        }
    fi
    
    print_success "$(msg DEPS_OK)"
}

create_directories() {
    print_header "$(msg CREATE_DIRS)"
    
    if [ -d "$INSTALL_DIR" ]; then
        print_warning "$(msg DIR_EXISTS): $INSTALL_DIR"
        read -p "$(msg OVERWRITE)" OVERWRITE
        
        # Aceitar s/S ou y/Y
        if [[ ! "$OVERWRITE" =~ ^[SsYy]$ ]]; then
            print_error "$(msg CANCEL)"
            exit 1
        fi
        sudo rm -rf "$INSTALL_DIR"
    fi
    
    sudo mkdir -p "$INSTALL_DIR/q4base"
    # Temp dir já foi criado em find_game_files, mas garantir que existe
    mkdir -p "$TEMP_DIR"
    
    print_success "$(msg DIRS_OK)"
}

copy_pk4_files() {
    print_header "$(msg COPY_FILES)"
    
    if [ "$SOURCE_TYPE" = "deb" ]; then
        # Extrair DEB
        print_info "$(msg COPYING)"
        dpkg -x "$SOURCE_PATH" "$TEMP_DIR/"
        
        # Procurar pelos arquivos .pk4
        PK4_SOURCE=$(find "$TEMP_DIR" -type d -name "q4base" | head -1)
        
        if [ -z "$PK4_SOURCE" ]; then
            # Se não encontrou q4base, procurar .pk4 diretamente
            PK4_FILES=$(find "$TEMP_DIR" -name "*.pk4")
            if [ -z "$PK4_FILES" ]; then
                print_error "$(msg NO_PK4) $TEMP_DIR"
                exit 1
            fi
            sudo cp $(find "$TEMP_DIR" -name "*.pk4") "$INSTALL_DIR/q4base/"
        else
            sudo cp -v "$PK4_SOURCE"/*.pk4 "$INSTALL_DIR/q4base/"
        fi
        
    elif [ "$SOURCE_TYPE" = "folder" ]; then
        # Copiar diretamente da pasta
        print_info "$(msg COPYING)"
        
        # Procurar por subpasta q4base
        if [ -d "$SOURCE_PATH/q4base" ]; then
            sudo cp -v "$SOURCE_PATH/q4base"/*.pk4 "$INSTALL_DIR/q4base/" 2>/dev/null || true
        fi
        
        # Também procurar recursivamente por .pk4
        find "$SOURCE_PATH" -name "*.pk4" -exec sudo cp -v {} "$INSTALL_DIR/q4base/" \; 2>/dev/null || true
    fi
    
    # Verificar se os arquivos foram copiados
    PK4_COUNT=$(ls -1 "$INSTALL_DIR/q4base"/*.pk4 2>/dev/null | wc -l)
    if [ "$PK4_COUNT" -eq 0 ]; then
        print_error "$(msg DATA_FAIL)"
        exit 1
    fi
    
    print_success "$(msg COPIED count "$PK4_COUNT")"
}

find_installer() {
    print_header "$(msg FIND_INSTALLER)"
    
    echo "$(msg INSTALLER_PROMPT)"
    echo ""
    echo "$(msg INSTALLER_OPT1)"
    echo "$(msg INSTALLER_OPT2)"
    echo ""
    read -p "$(msg INSTALLER_INPUT)" INSTALLER_PATH
    
    # Remover aspas se houver
    INSTALLER_PATH=$(echo "$INSTALLER_PATH" | sed "s/'//g" | sed 's/"//g')
    
    # Expandir ~ para $HOME
    INSTALLER_PATH="${INSTALLER_PATH/#\~/$HOME}"
    
    if [ ! -f "$INSTALLER_PATH" ]; then
        print_error "$(msg INSTALLER_NOT_FOUND) $INSTALLER_PATH"
        exit 1
    fi
    
    # Copiar para temp dir com nome padrão
    cp "$INSTALLER_PATH" "$TEMP_DIR/quake4-linux-1.4.2.x86.run"
    chmod +x "$TEMP_DIR/quake4-linux-1.4.2.x86.run"
    
    print_success "$(msg INSTALLER_COPIED)"
    print_success "$(msg INSTALLER_READY)"
}

run_installer() {
    print_header "$(msg RUN_INSTALLER)"
    
    cd "$TEMP_DIR"
    
    print_warning "$(msg INSTALLER_GUI)"
    print_info "$(msg INSTALLER_PATH) $INSTALL_DIR"
    
    if [ "$SCRIPT_LANG" = "pt" ]; then
        echo ""
        echo -e "${YELLOW}IMPORTANTE:${NC}"
        echo "  • O instalador será executado AGORA"
        echo "  • Use o caminho: ${GREEN}$INSTALL_DIR${NC}"
        echo "  • Quando perguntar 'Start now?', responda ${GREEN}n${NC} (não)"
        echo "  • O script continuará automaticamente após a instalação"
        echo ""
    else
        echo ""
        echo -e "${YELLOW}IMPORTANT:${NC}"
        echo "  • The installer will run NOW"
        echo "  • Use the path: ${GREEN}$INSTALL_DIR${NC}"
        echo "  • When asked 'Start now?', answer ${GREEN}n${NC} (no)"
        echo "  • The script will continue automatically after installation"
        echo ""
    fi
    
    print_info "$(msg PRESS_ENTER)"
    read
    
    # Executar instalador e aguardar conclusão
    if sudo sh ./quake4-linux-1.4.2.x86.run --target "$INSTALL_DIR"; then
        print_success "$(msg INSTALLER_DONE)"
    else
        print_error "$(msg INSTALLER_DONE) - Exit code: $?"
        if [ "$SCRIPT_LANG" = "pt" ]; then
            echo ""
            print_warning "O instalador pode ter falhado ou sido cancelado"
            read -p "Deseja continuar mesmo assim? (s/N): " CONTINUE_ANYWAY
            if [[ ! "$CONTINUE_ANYWAY" =~ ^[SsYy]$ ]]; then
                exit 1
            fi
        else
            echo ""
            print_warning "The installer may have failed or been cancelled"
            read -p "Do you want to continue anyway? (y/N): " CONTINUE_ANYWAY
            if [[ ! "$CONTINUE_ANYWAY" =~ ^[SsYy]$ ]]; then
                exit 1
            fi
        fi
    fi
}

fix_libraries() {
    print_header "$(msg FIX_LIBS)"
    
    cd "$INSTALL_DIR"
    
    # Mover bibliotecas antigas
    if ls lib*.so* 1> /dev/null 2>&1; then
        sudo mkdir -p temp/
        sudo mv lib*.so* temp/ 2>/dev/null || true
        print_success "$(msg LIBS_MOVED)"
    fi
    
    # Criar links simbólicos
    print_info "$(msg CREATE_LINKS)"
    
    if [ -f "/usr/lib/i386-linux-gnu/libSDL-1.2.so.0" ]; then
        sudo ln -sf /usr/lib/i386-linux-gnu/libSDL-1.2.so.0 libSDL-1.2.id.so.0
    fi
    
    if [ -f "/usr/lib/i386-linux-gnu/libgcc_s.so.1" ]; then
        sudo ln -sf /usr/lib/i386-linux-gnu/libgcc_s.so.1 libgcc_s.so.1
    fi
    
    if [ -f "/usr/lib/i386-linux-gnu/libstdc++.so.6" ]; then
        sudo ln -sf /usr/lib/i386-linux-gnu/libstdc++.so.6 libstdc++.so.6
    fi
    
    print_success "$(msg LINKS_OK)"
}

configure_language() {
    print_header "$(msg CONFIG_LANG)"
    
    CONFIG_DIR="$HOME/.quake4/q4base"
    CONFIG_FILE="$CONFIG_DIR/Quake4Config.cfg"
    
    if [ -f "$CONFIG_FILE" ]; then
        print_info "$(msg LANG_EN)"
        sed -i 's/seta sys_lang "spanish"/seta sys_lang "english"/' "$CONFIG_FILE"
        sed -i 's/seta sys_lang "portuguese"/seta sys_lang "english"/' "$CONFIG_FILE"
        print_success "$(msg LANG_OK)"
    else
        print_warning "$(msg LANG_WARN)"
    fi
}

download_icon() {
    local icon_dir="$HOME/.local/share/icons/hicolor/128x128/apps"
    mkdir -p "$icon_dir"
    
    for i in "${!ICON_URLS[@]}"; do
        print_info "$(msg DOWNLOAD_ICON n "$((i+1))" total "${#ICON_URLS[@]}")"
        if wget -q --timeout=30 "${ICON_URLS[$i]}" -O "$TEMP_DIR/quake4.png" 2>/dev/null; then
            if [ -s "$TEMP_DIR/quake4.png" ]; then
                sudo cp "$TEMP_DIR/quake4.png" "$icon_dir/"
                sudo chmod 644 "$icon_dir/quake4.png"
                print_success "$(msg ICON_OK)"
                return 0
            fi
        fi
    done
    
    print_warning "$(msg ICON_FAIL)"
    return 1
}

create_desktop_entry() {
    print_header "$(msg DESKTOP)"
    
    # Tentar baixar ícone
    download_icon
    
    # Criar diretórios para todos os usuários
    sudo mkdir -p /usr/local/share/applications/
    sudo mkdir -p /usr/local/share/icons/hicolor/128x128/apps/
    
    # Copiar ícone para diretório global
    if [ -f "$TEMP_DIR/quake4.png" ]; then
        sudo cp "$TEMP_DIR/quake4.png" /usr/local/share/icons/hicolor/128x128/apps/quake4.png
        sudo chmod 644 /usr/local/share/icons/hicolor/128x128/apps/quake4.png
        ICON_PATH="/usr/local/share/icons/hicolor/128x128/apps/quake4.png"
    else
        ICON_PATH="applications-games"
    fi
    
    print_info "Creating .desktop files for all users..."
    
    # Criar arquivos .desktop globais
    cat << EOF | sudo tee $HOME/.local/share/applications/quake4.desktop > /dev/null
[Desktop Entry]
Name=Quake 4
Comment=First-person shooter - sequel to Quake 2
Icon=$ICON_PATH
Exec=/usr/local/games/quake4/quake4
Terminal=false
Type=Application
Categories=Game;ActionGame;
EOF

    cat << EOF | sudo tee $HOME/.local/share/applications/quake4-smp.desktop > /dev/null
[Desktop Entry]
Name=Quake 4 SMP
Comment=First-person shooter - sequel to Quake 2
Icon=$ICON_PATH
Exec=/usr/local/games/quake4/quake4-smp
Terminal=false
Type=Application
Categories=Game;ActionGame;
EOF

    cat << EOF | sudo tee $HOME/.local/share/applications/quake4-smp-firejail.desktop > /dev/null
[Desktop Entry]
Name=Quake 4 SMP (Firejail)
Comment=First-person shooter - sequel to Quake 2 (sandboxed)
Icon=$ICON_PATH
Exec=firejail --net=none /usr/local/games/quake4/quake4-smp
Terminal=false
Type=Application
Categories=Game;ActionGame;
EOF

    cat << EOF | sudo tee $HOME/.local/share/applications/quake4-firejail.desktop > /dev/null
[Desktop Entry]
Name=Quake 4 (Firejail)
Comment=First-person shooter - sequel to Quake 2 (sandboxed)
Icon=$ICON_PATH
Exec=firejail --net=none /usr/local/games/quake4/quake4
Terminal=false
Type=Application
Categories=Game;ActionGame;
EOF
    
    # Configurar permissões para todos os usuários
    sudo chmod 644 $HOME/.local/share/applications/quake4*.desktop
    sudo chown root:root $HOME/.local/share/applications/quake4*.desktop
    
    # Atualizar banco de dados de ícones
    sudo update-desktop-database /usr/local/share/applications/
    
    print_success "$(msg DESKTOP_OK)"
}

create_quake4_key() {
    print_info "Creating quake4key file..."
    
    # Criar diretório de configuração para o usuário atual
    mkdir -p "$HOME/.quake4/q4base"
    
    # Criar arquivo quake4key
    echo "$QUAKE4_KEY" > "$HOME/.quake4/q4base/quake4key"
    
    # Configurar permissões
    chmod 644 "$HOME/.quake4/q4base/quake4key"
    
    print_success "quake4key file created at $HOME/.quake4/q4base/quake4key"
}

create_launcher_scripts() {
    print_header "$(msg LAUNCHER)"
    
    # Criar diretório para scripts de lançamento
    sudo mkdir -p /usr/local/games/quake4/scripts
    
    # Script principal quake4
    cat << 'EOF' | sudo tee /usr/local/bin/quake4 > /dev/null
#!/bin/bash
# Launcher for Quake 4
cd /usr/local/games/quake4
exec ./quake4 "$@"
EOF

    # Script quake4-smp
    cat << 'EOF' | sudo tee /usr/local/bin/quake4-smp > /dev/null
#!/bin/bash
# Launcher for Quake 4 SMP
cd /usr/local/games/quake4
exec ./quake4-smp "$@"
EOF
    
    # Script quake4-smp-firejail
    cat << 'EOF' | sudo tee /usr/local/bin/quake4-smp-firejail > /dev/null
#!/bin/bash
# Launcher for Quake 4 SMP with Firejail
exec firejail --net=none /usr/local/games/quake4/quake4-smp "$@"
EOF
    
    # Script quake4-firejail
    cat << 'EOF' | sudo tee /usr/local/bin/quake4-firejail > /dev/null
#!/bin/bash
# Launcher for Quake 4 with Firejail
exec firejail --net=none /usr/local/games/quake4/quake4 "$@"
EOF

#    # Script interno quake4smp (para ser executado dentro do diretório)
#    cat << 'EOF' | sudo tee /usr/local/games/quake4/quake4smp > /dev/null
##!/bin/sh
## Internal launcher for Quake 4 SMP
## Must run from correct working directory
#cd "/usr/local/games/quake4/"
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:."
#exec ./quake4smp.x86 "$@"
#EOF
    
    # Configurar permissões
    sudo chmod +x /usr/local/bin/quake4
    sudo chmod +x /usr/local/bin/quake4-smp
    sudo chmod +x /usr/local/bin/quake4-firejail
    sudo chmod +x /usr/local/bin/quake4-smp-firejail
    #sudo chmod +x /usr/local/games/quake4/quake4smp
    
    # Garantir que os arquivos de configuração existam para todos os usuários
    sudo mkdir -p /etc/skel/.quake4/q4base
    if [ -f "$HOME/.quake4/q4base/quake4key" ]; then
        sudo cp "$HOME/.quake4/q4base/quake4key" /etc/skel/.quake4/q4base/
        sudo chmod 644 /etc/skel/.quake4/q4base/quake4key
    fi
    
    print_success "$(msg LAUNCHER_OK)"
    
    if [ "$SCRIPT_LANG" = "pt" ]; then
        print_info "Scripts de lançamento criados:"
        echo "  • quake4                    (padrão)"
        echo "  • quake4-smp                (multi-core)"
        echo "  • quake4-firejail           (padrão sandbox)"
        echo "  • quake4-smp-firejail       (multi-core sandbox)"
    else
        print_info "Launcher scripts created:"
        echo "  • quake4                    (default)"
        echo "  • quake4-smp                (multi-core)"
        echo "  • quake4-firejail           (default sandbox)"
        echo "  • quake4-smp-firejail       (multi-core sandbox)"
    fi
}

cleanup() {
    print_header "$(msg CLEANUP)"
    
    print_info "Removing $TEMP_DIR..."
    rm -rf "$TEMP_DIR"
    
    print_success "$(msg CLEANUP_OK)"
}

test_installation() {
    print_header "$(msg TEST)"
    
    # Testar binários
    if [ -f "$INSTALL_DIR/quake4" ] || [ -f "$INSTALL_DIR/quake4-smp" ]; then
        print_success "$(msg BINARY_OK)"
    else
        print_error "$(msg BINARY_FAIL)"
        return 1
    fi
    
    # Testar arquivos de dados
    PK4_COUNT=$(ls -1 "$INSTALL_DIR/q4base"/*.pk4 2>/dev/null | wc -l)
    if [ "$PK4_COUNT" -gt 0 ]; then
        print_success "$(msg DATA_OK count "$PK4_COUNT")"
    else
        print_error "$(msg DATA_FAIL)"
        return 1
    fi
    
    # Testar scripts de lançamento
    if [ -f "/usr/local/bin/quake4" ] && [ -x "/usr/local/bin/quake4" ]; then
        print_success "Launcher scripts created successfully"
    else
        print_error "Launcher scripts not found"
        return 1
    fi
    
    # Testar arquivo quake4key
    if [ -f "$HOME/.quake4/q4base/quake4key" ]; then
        print_success "quake4key file created successfully"
    else
        print_warning "quake4key file not created"
    fi
    
    print_success "$(msg TEST_OK)"
}

print_final_instructions() {
    print_header "$(msg TEST_OK)"
    
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
    if [ "$SCRIPT_LANG" = "pt" ]; then
        echo -e "${GREEN}║          Quake 4 instalado com sucesso!               ║${NC}"
    else
        echo -e "${GREEN}║        Quake 4 installed successfully!                ║${NC}"
    fi
    echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    if [ "$SCRIPT_LANG" = "pt" ]; then
        echo -e "${BLUE}Para jogar:${NC}"
        echo -e "  • Procure por 'Quake 4' no menu de aplicativos"
        echo -e "  • Ou execute no terminal: ${GREEN}quake4${NC}"
        echo -e "  • Ou execute diretamente: ${GREEN}$INSTALL_DIR/quake4-smp${NC}"
        echo ""
        echo -e "${YELLOW}Dicas:${NC}"
        echo -e "  • Use ${GREEN}quake4-smp${NC} para melhor performance (multi-core)"
        echo -e "  • Se o idioma estiver errado, edite: ~/.quake4/q4base/Quake4Config.cfg"
        echo -e "  • Para widescreen, ajuste resolução nas configurações do jogo"
        echo ""
        echo -e "${RED}⚠ PROBLEMAS DE ÁUDIO? Tente estes comandos:${NC}"
        echo -e "  ${GREEN}sudo apt install pipewire-alsa:i386"
        echo ""
        echo -e "${BLUE}Outros problemas:${NC}"
        echo -e "  • No Wayland? Execute: ${GREEN}SDL_VIDEODRIVER=x11 quake4${NC}"
        echo -e "  • Erros OpenGL? Atualize drivers da GPU"
        echo ""
        echo -e "${GREEN}Bom jogo! Happy fragging!${NC}"
    else
        echo -e "${BLUE}To play:${NC}"
        echo -e "  • Search for 'Quake 4' in applications menu"
        echo -e "  • Or run in terminal: ${GREEN}quake4${NC}"
        echo -e "  • Or run directly: ${GREEN}$INSTALL_DIR/quake4-smp${NC}"
        echo ""
        echo -e "${YELLOW}Tips:${NC}"
        echo -e "  • Use ${GREEN}quake4-smp${NC} for better performance (multi-core)"
        echo -e "  • If language is wrong, edit: ~/.quake4/q4base/Quake4Config.cfg"
        echo -e "  • For widescreen, adjust resolution in game settings"
        echo ""
        echo -e "${RED}⚠ AUDIO PROBLEMS? Try these commands:${NC}"
        echo -e "  ${GREEN}sudo apt install pipewire-alsa:i386"
        echo ""
        echo -e "${BLUE}Other issues:${NC}"
        echo -e "  • On Wayland? Run: ${GREEN}SDL_VIDEODRIVER=x11 quake4${NC}"
        echo -e "  • OpenGL errors? Update GPU drivers"
        echo ""
        echo -e "${GREEN}Have fun! Happy fragging!${NC}"
    fi
    echo ""
}

# ============================================================================
# MAIN - Execução principal do script / Main execution
# ============================================================================

main() {
    # Detectar idioma primeiro
    detect_language
    
    clear
    print_header "$(msg TITLE)"
    echo ""
    
    if [ "$SCRIPT_LANG" = "pt" ]; then
        echo "Este script irá instalar o Quake 4 nativamente no seu Linux Mint 22.1"
        echo "Baseado no guia de Lucas Williams (lucaswilliams.net)"
        echo ""
        print_warning "IMPORTANTE: Você precisa ter uma cópia LEGÍTIMA do jogo"
        echo ""
    else
        echo "This script will install Quake 4 natively on your Linux Mint 22.1"
        echo "Based on Lucas Williams guide (lucaswilliams.net)"
        echo ""
        print_warning "IMPORTANT: You need to have a LEGAL copy of the game"
        echo ""
    fi
    
    read -p "$(msg CONTINUE)" CONTINUE
    
    # Aceitar s/S ou y/Y
    if [[ ! "$CONTINUE" =~ ^[SsYy]$ ]]; then
        print_error "$(msg CANCEL)"
        exit 0
    fi
    
    echo ""
    
    # Executar etapas
    check_root
    check_dependencies
    find_game_files
    find_installer
    install_system_dependencies
    create_directories
    copy_pk4_files
    run_installer
    fix_libraries
    configure_language
    create_desktop_entry
    create_quake4_key
    create_launcher_scripts
    cleanup
    test_installation
    print_final_instructions
}

# Executar script / Run script
main
