# Quake 4 - Automatic Installer for Linux
# Quake 4 - Instalador Automático para Linux

<div align="center">

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Linux%20Mint%2022.1%20%7C%20Ubuntu%2024.04-orange.svg)]()
[![Shell Script](https://img.shields.io/badge/shell-bash-green.svg)]()

[🇺🇸 English](#english) | [🇧🇷 Português (BR)](#português-br)

</div>

---

## ⚠️ IMPORTANT DISCLAIMER / AVISO IMPORTANTE

### 🇺🇸 English

**THIS SCRIPT DOES NOT DISTRIBUTE ANY GAME FILES OR INSTALLERS**

This is an installation assistant script only. You **MUST** obtain the game files and installer from legitimate sources. This script merely automates the installation process on modern Linux systems.

### 🇧🇷 Português (BR)

**ESTE SCRIPT NÃO DISTRIBUI QUAISQUER ARQUIVOS DO JOGO OU INSTALADORES**

Este é apenas um script assistente de instalação. Você **DEVE** obter os arquivos do jogo e o instalador de fontes legítimas. Este script apenas automatiza o processo de instalação em sistemas Linux modernos.

---

# English

## 📋 Table of Contents

- [About](#about)
- [What This Script Does](#what-this-script-does)
- [Prerequisites](#prerequisites)
- [Where to Get Game Files](#where-to-get-game-files)
- [Where to Get the Linux Installer](#where-to-get-the-linux-installer)
- [Installation](#installation)
- [Usage](#usage)
- [What Gets Installed](#what-gets-installed)
- [Launching the Game](#launching-the-game)
- [Troubleshooting](#troubleshooting)
- [Firejail Sandbox](#firejail-sandbox)
- [Uninstallation](#uninstallation)

## 🎮 About

This script automates the installation of Quake 4 natively on modern Linux systems (Linux Mint 22.1 / Ubuntu 24.04 and derivatives). It's based on the excellent guide by [Lucas Williams](https://www.lucaswilliams.net).

## 🔧 What This Script Does

The script performs the following tasks:

1. **Detects system language** (English/Portuguese) and adapts messages
2. **Checks system compatibility** (Debian/Ubuntu-based systems)
3. **Locates your game files** (from various sources)
4. **Installs system dependencies** (libraries, sound system, etc.)
5. **Runs the official Linux installer** (interactive GUI)
6. **Fixes library compatibility issues** (creates proper symbolic links)
7. **Configures the game** (sets English language by default)
8. **Creates desktop shortcuts** (4 variants: normal, SMP, sandboxed)
9. **Creates terminal commands** (`quake4`, `quake4-smp`, etc.)
10. **Tests the installation** (verifies all files are in place)

## 📦 Prerequisites

- **A legitimate copy of Quake 4** (game data files)
- **The Linux installer** (`quake4-linux-1.4.2.x86.run`)
- **Linux Mint 22.1 or Ubuntu 24.04** (or derivatives)
- **Approximately 3-4 GB of free disk space**
- **Internet connection** (for downloading dependencies)

## 📂 Where to Get Game Files

You need the game data files (`.pk4` files). You can obtain them from:

### Option 1: DEB Package (Recommended - Most Practical)
- **Archive.org**: Search for "quake4 data deb"
- File name: `quake4-data.deb` or similar
- **✅ Recommended**: Easy to use, just provide the path to the script

### Option 2: Original Media
- **Original CD/DVD**: If you own the physical game
- Mount the disc and point the script to the `q4base` folder

### Option 3: Steam Installation
- If you own the game on Steam (Windows version)
- Install via Steam on Linux (with Proton)
- Locate the installation folder (usually `~/.steam/steam/steamapps/common/Quake 4/`)
- Point the script to the `q4base` folder

### Option 4: Wine Installation
- If you have Windows version installed via Wine
- Locate the installation folder (usually `~/.wine/drive_c/Program Files/Quake 4/`)
- Point the script to the `q4base` folder

### Option 5: Loose Files
- Any folder containing the `.pk4` files from the `q4base` directory
- The script will find them automatically

**What are .pk4 files?**
- `.pk4` files are compressed archives containing game data (textures, models, sounds, etc.)
- You should have approximately 10-15 `.pk4` files totaling about 2.5-3 GB
- File names like: `pak001.pk4`, `pak002.pk4`, `zpak_*.pk4`, etc.

## 🔽 Where to Get the Linux Installer

The official Quake 4 Linux installer (v1.4.2) is **freely distributed** by id Software and can be downloaded from:

### Sources:
1. **Lucas Williams Mirror** (Recommended):
   - https://www.lucaswilliams.net/files/quake4-linux-1.4.2.x86.run

2. **ausgamers**:
   - https://archive.org/download/quake4-linux/quake4-linux-1.4.2.x86.run](https://www.ausgamers.com/files/download/28958/quake-4-patch-v142-for-linux

3. **Holarse Linux Gaming**:
   - https://files.holarse-linuxgaming.de/native/Spiele/Quake%20IV/

**Note**: The installer file should be approximately 274.2MB and named `quake4-linux-1.4.2.x86.run`

## 💿 Installation

### Step 1: Download the Script
```bash
wget https://raw.githubusercontent.com/hudsonalbuquerque97-sys/quake4-linux-installer/refs/heads/main/quake4_installer.sh
chmod +x quake4_installer.sh
```

### Step 2: Prepare Your Files
Make sure you have:
- [ ] Game data files (one of the sources above)
- [ ] Linux installer (`quake4-linux-1.4.2.x86.run`)

### Step 3: Run the Script
```bash
./quake4_installer.sh
```

The script will:
1. Ask you to confirm you want to continue
2. Request the path to your game files
3. Request the path to the Linux installer
4. Install all necessary dependencies (requires sudo password)
5. Run the official installer (GUI will appear)
6. Complete the setup automatically

### Step 4: Follow the Installer GUI

When the official installer appears, answer the prompts as follows:

> **⚠️ CRITICAL**: Follow these steps exactly or the game won't work!

| Step | Question | Answer | Notes |
|------|----------|--------|-------|
| 1 | Accept license? | **Y** | Accept the EULA |
| 2 | Read README? | **N** | Optional, skip to save time |
| 3 | Install "All versions (except German release)"? | **Y** | Install all language files |
| 4 | Installation path | `/usr/local/games/quake4` | **Use exactly this path** (provided by script) |
| 5 | Create symbolic links? | **Y** | Then choose `/usr/local/bin` |
| 6 | Create desktop shortcuts? | **N** | Script will create better ones |
| 7 | Install PunkBuster? | **N** | Optional, doesn't work anymore |
| 8 | Continue with installation? | **Y** | Proceed with file copy |
| 9 | **Start now?** | **N** | **CRITICAL: Say NO!** Script needs to finish setup |

**Why answer "N" to "Start now?"**
- The script still needs to:
  - Fix library compatibility issues
  - Create proper launcher scripts
  - Create desktop shortcuts
  - Configure the game
- Starting the game before these steps will cause errors!

## 📍 What Gets Installed

### Installation Directory Structure
```
/usr/local/games/quake4/
├── quake4                  # Main binary (single-core)
├── quake4-smp              # SMP binary (multi-core, recommended)
├── q4base/                 # Game data directory
│   ├── pak001.pk4
│   ├── pak002.pk4
│   └── [other .pk4 files]
├── libSDL-1.2.id.so.0      # Symbolic links to system libraries
├── libgcc_s.so.1
└── libstdc++.so.6
```

### User Configuration Directory
```
~/.quake4/
└── q4base/
    ├── Quake4Config.cfg    # Game configuration
    └── quake4key           # Your CD key
```

### Desktop Shortcuts (4 variants)
```
~/.local/share/applications/
├── quake4.desktop                    # Standard version
├── quake4-smp.desktop                # Multi-core version (recommended)
├── quake4-firejail.desktop           # Sandboxed standard
└── quake4-smp-firejail.desktop       # Sandboxed multi-core
```

### Terminal Commands
```
/usr/local/bin/
├── quake4                  # Launch standard version
├── quake4-smp              # Launch multi-core version
├── quake4-firejail         # Launch sandboxed standard
└── quake4-smp-firejail     # Launch sandboxed multi-core
```

## 🎯 Launching the Game

### From Applications Menu
- Search for "Quake 4" in your applications menu
- Choose between:
  - **Quake 4**: Standard version
  - **Quake 4 SMP**: Multi-core version (**recommended for better performance**)
  - **Quake 4 (Firejail)**: Sandboxed standard version
  - **Quake 4 SMP (Firejail)**: Sandboxed multi-core version

### From Terminal
```bash
# Recommended (best performance)
quake4-smp

# Standard
quake4

# Sandboxed versions
quake4-firejail
quake4-smp-firejail

# Or run directly
/usr/local/games/quake4/quake4-smp
```

### Command Line Options
```bash
# Windowed mode
quake4-smp +set r_fullscreen 0

# Custom resolution
quake4-smp +set r_customWidth 1920 +set r_customHeight 1080

# Skip intro videos
quake4-smp +set g_skipIntro 1
```

## 🔧 Troubleshooting

### 🔊 Audio Issues (MOST COMMON)

**Problem**: No sound or crackling audio

**Solution**: Install PipeWire ALSA plugin
```bash
sudo apt install pipewire-alsa:i386
```

**Why?** Linux Mint 22.1 and Ubuntu 24.04 use PipeWire for audio by default, but the 32-bit ALSA compatibility layer may not be installed. Quake 4 is a 32-bit application and needs this plugin.

**Alternative**: If the above doesn't work, try:
```bash
# Check if PulseAudio is running
pulseaudio --check && echo "PulseAudio is running"

# If yes, restart it
pulseaudio -k && pulseaudio --start

# If using ALSA directly
sudo apt install libasound2-plugins:i386
```

### 🖥️ Display Issues

**Problem**: Game won't start on Wayland

**Solution**: Force X11 mode
```bash
SDL_VIDEODRIVER=x11 quake4-smp
```

**Problem**: Black screen or OpenGL errors

**Solution**:
1. Update GPU drivers:
```bash
# For NVIDIA
sudo ubuntu-drivers autoinstall

# For AMD
sudo apt install mesa-utils mesa-vulkan-drivers

# For Intel
sudo apt install mesa-utils intel-media-va-driver
```

2. Check OpenGL support:
```bash
glxinfo | grep "OpenGL version"
```

### 🎮 Performance Issues

**Problem**: Low FPS or stuttering

**Solutions**:
1. Use SMP version (multi-core):
```bash
quake4-smp
```

2. Adjust in-game settings:
   - Lower texture quality
   - Disable shadows
   - Reduce resolution
   - Disable anti-aliasing

3. Check system resources:
```bash
htop  # Monitor CPU/RAM usage
nvidia-smi  # For NVIDIA GPUs
```

### 🌍 Language Issues

**Problem**: Game is in wrong language

**Solution**: Edit config file
```bash
nano ~/.quake4/q4base/Quake4Config.cfg
```

Find and change:
```
seta sys_lang "spanish"  →  seta sys_lang "english"
seta sys_lang "portuguese"  →  seta sys_lang "english"
```

Or run the game with:
```bash
quake4-smp +set sys_lang english
```

### 📦 Library Issues

**Problem**: Missing library errors

**Solution**: The script should fix this, but manually:
```bash
cd /usr/local/games/quake4
sudo rm lib*.so*  # Remove bundled old libraries
sudo ln -sf /usr/lib/i386-linux-gnu/libSDL-1.2.so.0 libSDL-1.2.id.so.0
sudo ln -sf /usr/lib/i386-linux-gnu/libgcc_s.so.1 libgcc_s.so.1
sudo ln -sf /usr/lib/i386-linux-gnu/libstdc++.so.6 libstdc++.so.6
```

### 🔐 CD Key Issues

**Problem**: Game asks for CD key every time

**Solution**: Check the key file
```bash
cat ~/.quake4/q4base/quake4key
```

If empty or missing:
```bash
echo "YOUR-CD-KEY-HERE" > ~/.quake4/q4base/quake4key
chmod 644 ~/.quake4/q4base/quake4key
```

### 💾 Save Game Issues

**Problem**: Can't save games

**Solution**: Fix permissions
```bash
chmod -R u+w ~/.quake4/
```

## 🛡️ Firejail Sandbox

### What is Firejail?
Firejail is a security tool that runs applications in an isolated "sandbox" environment. This means:
- **Network isolation**: Game can't access the internet (prevents potential exploits)
- **File system isolation**: Limited access to your files
- **Process isolation**: Can't interfere with other running programs

### Why Use Sandboxed Versions?
- **Security**: Older games may have unpatched vulnerabilities
- **Privacy**: Prevents any potential telemetry or data collection
- **Peace of mind**: Extra layer of protection

### When to Use Each Version?
- **quake4-smp**: Best performance, use if you trust the game
- **quake4-smp-firejail**: Slightly more secure, minimal performance impact
- Choose based on your comfort level with running older software

### Firejail Options
The sandboxed versions run with:
```bash
firejail --net=none /usr/local/games/quake4/quake4-smp
```

`--net=none` disables all network access. You can customize if needed.

## 🗑️ Uninstallation

### Complete Removal
```bash
# Remove game installation
sudo rm -rf /usr/local/games/quake4

# Remove desktop shortcuts
rm -f ~/.local/share/applications/quake4*.desktop
sudo rm -f /usr/local/share/applications/quake4*.desktop

# Remove terminal commands
sudo rm -f /usr/local/bin/quake4*

# Remove user configuration (saves your settings/saves!)
rm -rf ~/.quake4

# Remove icon
rm -f ~/.local/share/icons/hicolor/128x128/apps/quake4.png
sudo rm -f /usr/local/share/icons/hicolor/128x128/apps/quake4.png

# Update desktop database
sudo update-desktop-database /usr/local/share/applications/
```

### Keep Configuration (for reinstall)
Skip the `rm -rf ~/.quake4` step to keep your settings and saves.

## 📜 Credits

- **Original Guide**: [Lucas Williams](https://www.lucaswilliams.net)
- **id Software**: For releasing the Linux installer
- **Community**: Linux gaming enthusiasts

## 📄 License

This script is provided as-is under MIT License. Use at your own risk.

**Remember**: You must own a legitimate copy of Quake 4 to use this script.

---

# Português (BR)

## 📋 Índice

- [Sobre](#sobre)
- [O Que Este Script Faz](#o-que-este-script-faz)
- [Pré-requisitos](#pré-requisitos)
- [Onde Conseguir os Arquivos do Jogo](#onde-conseguir-os-arquivos-do-jogo)
- [Onde Conseguir o Instalador Linux](#onde-conseguir-o-instalador-linux)
- [Instalação](#instalação-1)
- [Uso](#uso)
- [O Que é Instalado](#o-que-é-instalado)
- [Iniciando o Jogo](#iniciando-o-jogo)
- [Resolução de Problemas](#resolução-de-problemas)
- [Sandbox Firejail](#sandbox-firejail)
- [Desinstalação](#desinstalação)

## 🎮 Sobre

Este script automatiza a instalação do Quake 4 nativamente em sistemas Linux modernos (Linux Mint 22.1 / Ubuntu 24.04 e derivados). É baseado no excelente guia de [Lucas Williams](https://www.lucaswilliams.net).

## 🔧 O Que Este Script Faz

O script realiza as seguintes tarefas:

1. **Detecta o idioma do sistema** (Inglês/Português) e adapta mensagens
2. **Verifica compatibilidade do sistema** (sistemas baseados em Debian/Ubuntu)
3. **Localiza seus arquivos do jogo** (de várias fontes)
4. **Instala dependências do sistema** (bibliotecas, sistema de som, etc.)
5. **Executa o instalador oficial Linux** (GUI interativa)
6. **Corrige problemas de compatibilidade de bibliotecas** (cria links simbólicos apropriados)
7. **Configura o jogo** (define inglês como idioma padrão)
8. **Cria atalhos no menu** (4 variantes: normal, SMP, sandbox)
9. **Cria comandos no terminal** (`quake4`, `quake4-smp`, etc.)
10. **Testa a instalação** (verifica se todos os arquivos estão no lugar)

## 📦 Pré-requisitos

- **Uma cópia legítima do Quake 4** (arquivos de dados do jogo)
- **O instalador Linux** (`quake4-linux-1.4.2.x86.run`)
- **Linux Mint 22.1 ou Ubuntu 24.04** (ou derivados)
- **Aproximadamente 3-4 GB de espaço livre em disco**
- **Conexão com a internet** (para baixar dependências)

## 📂 Onde Conseguir os Arquivos do Jogo

Você precisa dos arquivos de dados do jogo (arquivos `.pk4`). Você pode obtê-los de:

### Opção 1: Pacote DEB (Recomendado - Mais Prático)
- **Archive.org**: Procure por "quake4 data deb"
- Nome do arquivo: `quake4-data.deb` ou similar
- **✅ Recomendado**: Fácil de usar, apenas forneça o caminho ao script

### Opção 2: Mídia Original
- **CD/DVD Original**: Se você possui o jogo físico
- Monte o disco e aponte o script para a pasta `q4base`

### Opção 3: Instalação Steam
- Se você possui o jogo na Steam (versão Windows)
- Instale via Steam no Linux (com Proton)
- Localize a pasta de instalação (geralmente `~/.steam/steam/steamapps/common/Quake 4/`)
- Aponte o script para a pasta `q4base`

### Opção 4: Instalação Wine
- Se você tem a versão Windows instalada via Wine
- Localize a pasta de instalação (geralmente `~/.wine/drive_c/Program Files/Quake 4/`)
- Aponte o script para a pasta `q4base`

### Opção 5: Arquivos Soltos
- Qualquer pasta contendo os arquivos `.pk4` do diretório `q4base`
- O script os encontrará automaticamente

**O que são arquivos .pk4?**
- Arquivos `.pk4` são arquivos compactados contendo dados do jogo (texturas, modelos, sons, etc.)
- Você deve ter aproximadamente 10-15 arquivos `.pk4` totalizando cerca de 2.5-3 GB
- Nomes de arquivo como: `pak001.pk4`, `pak002.pk4`, `zpak_*.pk4`, etc.

## 🔽 Onde Conseguir o Instalador Linux

O instalador oficial do Quake 4 para Linux (v1.4.2) é **distribuído gratuitamente** pela id Software e pode ser baixado de:

### Fontes:
1. **Mirror do Lucas Williams** (Recomendado):
   - https://www.lucaswilliams.net/files/quake4-linux-1.4.2.x86.run

2. **ausgamers**:
   - https://archive.org/download/quake4-linux/quake4-linux-1.4.2.x86.run](https://www.ausgamers.com/files/download/28958/quake-4-patch-v142-for-linux

3. **Holarse Linux Gaming**:
   - https://files.holarse-linuxgaming.de/native/Spiele/Quake%20IV/

**Nota**: O arquivo do instalador deve ter aproximadamente	274.2MB e se chamar `quake4-linux-1.4.2.x86.run`

## 💿 Instalação

### Passo 1: Baixar o Script
```bash
wget https://raw.githubusercontent.com/hudsonalbuquerque97-sys/quake4-linux-installer/refs/heads/main/quake4_installer.sh
chmod +x quake4_installer.sh
```

### Passo 2: Preparar Seus Arquivos
Certifique-se de ter:
- [ ] Arquivos de dados do jogo (uma das fontes acima)
- [ ] Instalador Linux (`quake4-linux-1.4.2.x86.run`)

### Passo 3: Executar o Script
```bash
./quake4_installer_v7.sh
```

O script irá:
1. Pedir para confirmar que deseja continuar
2. Solicitar o caminho para seus arquivos do jogo
3. Solicitar o caminho para o instalador Linux
4. Instalar todas as dependências necessárias (requer senha sudo)
5. Executar o instalador oficial (GUI aparecerá)
6. Completar a configuração automaticamente

### Passo 4: Seguir a GUI do Instalador

Quando o instalador oficial aparecer, responda às perguntas da seguinte forma:

> **⚠️ CRÍTICO**: Siga estes passos exatamente ou o jogo não funcionará!

| Etapa | Pergunta | Resposta | Observações |
|-------|----------|----------|-------------|
| 1 | Aceitar licença? | **Y** | Aceite a EULA |
| 2 | Ler README? | **N** | Opcional, pule para economizar tempo |
| 3 | Instalar "All versions (except German release)"? | **Y** | Instala todos os arquivos de idioma |
| 4 | Caminho de instalação | `/usr/local/games/quake4` | **Use exatamente este caminho** (fornecido pelo script) |
| 5 | Criar links simbólicos? | **Y** | Depois escolha `/usr/local/bin` |
| 6 | Criar atalhos no desktop? | **N** | O script criará melhores |
| 7 | Instalar PunkBuster? | **N** | Opcional, não funciona mais |
| 8 | Continuar com instalação? | **Y** | Prosseguir com cópia de arquivos |
| 9 | **Iniciar agora?** | **N** | **CRÍTICO: Responda NÃO!** Script precisa terminar configuração |

**Por que responder "N" para "Iniciar agora?"**
- O script ainda precisa:
  - Corrigir problemas de compatibilidade de bibliotecas
  - Criar scripts de lançamento apropriados
  - Criar atalhos no menu
  - Configurar o jogo
- Iniciar o jogo antes desses passos causará erros!

## 📍 O Que é Instalado

### Estrutura do Diretório de Instalação
```
/usr/local/games/quake4/
├── quake4                  # Binário principal (single-core)
├── quake4-smp              # Binário SMP (multi-core, recomendado)
├── q4base/                 # Diretório de dados do jogo
│   ├── pak001.pk4
│   ├── pak002.pk4
│   └── [outros arquivos .pk4]
├── libSDL-1.2.id.so.0      # Links simbólicos para bibliotecas do sistema
├── libgcc_s.so.1
└── libstdc++.so.6
```

### Diretório de Configuração do Usuário
```
~/.quake4/
└── q4base/
    ├── Quake4Config.cfg    # Configuração do jogo
    └── quake4key           # Sua chave de CD
```

### Atalhos no Menu (4 variantes)
```
~/.local/share/applications/
├── quake4.desktop                    # Versão padrão
├── quake4-smp.desktop                # Versão multi-core (recomendada)
├── quake4-firejail.desktop           # Padrão em sandbox
└── quake4-smp-firejail.desktop       # Multi-core em sandbox
```

### Comandos no Terminal
```
/usr/local/bin/
├── quake4                  # Iniciar versão padrão
├── quake4-smp              # Iniciar versão multi-core
├── quake4-firejail         # Iniciar padrão em sandbox
└── quake4-smp-firejail     # Iniciar multi-core em sandbox
```

## 🎯 Iniciando o Jogo

### Do Menu de Aplicativos
- Procure por "Quake 4" no menu de aplicativos
- Escolha entre:
  - **Quake 4**: Versão padrão
  - **Quake 4 SMP**: Versão multi-core (**recomendado para melhor desempenho**)
  - **Quake 4 (Firejail)**: Versão padrão em sandbox
  - **Quake 4 SMP (Firejail)**: Versão multi-core em sandbox

### Do Terminal
```bash
# Recomendado (melhor desempenho)
quake4-smp

# Padrão
quake4

# Versões em sandbox
quake4-firejail
quake4-smp-firejail

# Ou executar diretamente
/usr/local/games/quake4/quake4-smp
```

### Opções de Linha de Comando
```bash
# Modo janela
quake4-smp +set r_fullscreen 0

# Resolução personalizada
quake4-smp +set r_customWidth 1920 +set r_customHeight 1080

# Pular vídeos de introdução
quake4-smp +set g_skipIntro 1
```

## 🔧 Resolução de Problemas

### 🔊 Problemas de Áudio (MAIS COMUM)

**Problema**: Sem som ou áudio com chiados

**Solução**: Instalar plugin PipeWire ALSA
```bash
sudo apt install pipewire-alsa:i386
```

**Por quê?** Linux Mint 22.1 e Ubuntu 24.04 usam PipeWire para áudio por padrão, mas a camada de compatibilidade ALSA 32-bit pode não estar instalada. Quake 4 é uma aplicação 32-bit e precisa deste plugin.

**Alternativa**: Se o acima não funcionar, tente:
```bash
# Verificar se PulseAudio está rodando
pulseaudio --check && echo "PulseAudio está rodando"

# Se sim, reinicie-o
pulseaudio -k && pulseaudio --start

# Se usando ALSA diretamente
sudo apt install libasound2-plugins:i386
```

### 🖥️ Problemas de Vídeo

**Problema**: Jogo não inicia no Wayland

**Solução**: Forçar modo X11
```bash
SDL_VIDEODRIVER=x11 quake4-smp
```

**Problema**: Tela preta ou erros OpenGL

**Solução**:
1. Atualizar drivers da GPU:
```bash
# Para NVIDIA
sudo ubuntu-drivers autoinstall

# Para AMD
sudo apt install mesa-utils mesa-vulkan-drivers

# Para Intel
sudo apt install mesa-utils intel-media-va-driver
```

2. Verificar suporte OpenGL:
```bash
glxinfo | grep "OpenGL version"
```

### 🎮 Problemas de Desempenho

**Problema**: FPS baixo ou travamentos

**Soluções**:
1. Use a versão SMP (multi-core):
```bash
quake4-smp
```

2. Ajustar configurações no jogo:
   - Diminuir qualidade de textura
   - Desabilitar sombras
   - Reduzir resolução
   - Desabilitar anti-aliasing

3. Verificar recursos do sistema:
```bash
htop  # Monitorar uso de CPU/RAM
nvidia-smi  # Para GPUs NVIDIA
```

### 🌍 Problemas de Idioma

Problema: Jogo está em idioma errado

Solução: Editar arquivo de configuração

```bash
nano ~/.quake4/q4base/Quake4Config.cfg
```

Encontre e mude:

```bash
seta sys_lang "spanish"  →  seta sys_lang "english"
seta sys_lang "portuguese"  →  seta sys_lang "english"
```
Ou execute o jogo com:

```bash
quake4-smp +set sys_lang english
```

### 📦 Problemas de Bibliotecas

Problema: Erros de biblioteca faltando

Solução: O script deve corrigir isso, mas manualmente:

```bash

cd /usr/local/games/quake4
sudo rm lib*.so*  # Remover bibliotecas antigas incluídas
sudo ln -sf /usr/lib/i386-linux-gnu/libSDL-1.2.so.0 libSDL-1.2.id.so.0
sudo ln -sf /usr/lib/i386-linux-gnu/libgcc_s.so.1 libgcc_s.so.1
sudo ln -sf /usr/lib/i386-linux-gnu/libstdc++.so.6 libstdc++.so.6
```

### 🔐 Problemas com Chave de CD

Problema: Jogo pede chave de CD toda vez

Solução: Verificar arquivo da chave

```bash

cat ~/.quake4/q4base/quake4key
```
Se vazio ou faltando:

```bash

echo "SUA-CHAVE-CD-AQUI" > ~/.quake4/q4base/quake4key
chmod 644 ~/.quake4/q4base/quake4key
```

### 💾 Problemas para Salvar Jogo

Problema: Não consegue salvar jogos

Solução: Corrigir permissões

```bash

chmod -R u+w ~/.quake4/
```

### 🛡️ Sandbox Firejail

O Que é Firejail?

Firejail é uma ferramenta de segurança que executa aplicações em um ambiente "sandbox" isolado. Isso significa:

- **Isolamento de rede:** Jogo não pode acessar a internet (previne potenciais exploits)
- **Isolamento do sistema de arquivos:** Acesso limitado aos seus arquivos
- **Isolamento de processos:** Não pode interferir com outros programas em execução

Por Que Usar Versões em Sandbox?

- **Segurança:** Jogos antigos podem ter vulnerabilidades não corrigidas
- **Privacidade:** Previne qualquer potencial telemetria ou coleta de dados
- **Paz de espírito:** Camada extra de proteção

Quando Usar Cada Versão?

- **quake4-smp:** Melhor desempenho, use se confiar no jogo
- **quake4-smp-firejail:** Mais seguro, impacto mínimo no desempenho
- **Escolha baseado no seu nível de conforto ao executar software antigo**

Opções do Firejail

As versões em sandbox executam com:

```bash

firejail --net=none /usr/local/games/quake4/quake4-smp
```

**--net=none desabilita todo acesso à rede. Você pode personalizar se necessário.**

### 🗑️ Desinstalação

Remoção Completa

```bash

# Remover instalação do jogo
sudo rm -rf /usr/local/games/quake4

# Remover atalhos no menu
rm -f ~/.local/share/applications/quake4*.desktop
sudo rm -f /usr/local/share/applications/quake4*.desktop

# Remover comandos no terminal
sudo rm -f /usr/local/bin/quake4*

#Remover configuração do usuário (salva suas configurações/saves!)
rm -rf ~/.quake4

# Remover ícone
rm -f ~/.local/share/icons/hicolor/128x128/apps/quake4.png
sudo rm -f /usr/local/share/icons/hicolor/128x128/apps/quake4.png

# Atualizar banco de dados do desktop

sudo update-desktop-database /usr/local/share/applications/
```

### Manter Configuração (para reinstalação)
Pule o passo `rm -rf ~/.quake4` para manter suas configurações e saves.

### 📜 Créditos

- **Guia Original**: [Lucas Williams](https://www.lucaswilliams.net)
- **id Software**: Por liberar o instalador Linux
- **Comunidade**: Entusiastas de jogos no Linux

### 📄 Licença

Este script é fornecido como está sob Licença MIT. Use por sua conta e risco.

**Lembre-se**: Você deve possuir uma cópia legítima do Quake 4 para usar este script.

---

## 🤝 Contributing / Contribuindo

Contributions are welcome! Feel free to open issues or pull requests.

Contribuições são bem-vindas! Sinta-se livre para abrir issues ou pull requests.
<div align="center">

## ⭐ Star History

If this script helped you, consider giving it a star! ⭐

Se este script te ajudou, considere dar uma estrela! ⭐
<div align="center">

