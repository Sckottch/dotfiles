# Configuração do Neovim

## Sumário de dependências

| Dependência | Para que serve | Obrigatório? |
|---|---|---|
| Neovim ≥ 0.11 | API `vim.lsp.config`/`vim.lsp.enable` usada em `lsp.lua` | Sim |
| Git | Clonar plugins (lazy.nvim) e `gitsigns.nvim` | Sim |
| Compilador C | Compilar parsers do Treesitter (`:TSUpdate`) | Sim |
| ripgrep (`rg`) | Busca de texto no picker (`snacks.nvim`) | Sim |
| fd | Busca de arquivos mais rápida no picker | Recomendado |
| lazygit | UI de git (`<leader>gg`) | Sim, se for usar esse atalho |
| Nerd Font | Ícones (bufferline, lualine, picker, blink.cmp) | Sim |
| Node.js + npm | Servidores LSP `ts_ls` e `basedpyright` (via Mason) | Sim |
| Python 3 | `basedpyright` precisa resolver imports do projeto analisado | Sim |
| win32yank / xclip / wl-clipboard | Integração com clipboard do sistema (`<leader>y`) | Sim |
| Rust (cargo) | Fallback do `blink.cmp` se o binário pré-compilado não existir pra sua plataforma | Opcional |

---

## Instalação no Windows

Recomendado usar [winget](https://learn.microsoft.com/windows/package-manager/winget/) ou [scoop](https://scoop.sh/).

```powershell
# Neovim
winget install Neovim.Neovim

# Git
winget install Git.Git

# Compilador C (necessário pro Treesitter compilar parsers)
winget install --id=mstorsjo.llvm-mingw   # ou instale via MSYS2/Visual Studio Build Tools

# ripgrep e fd
winget install BurntSushi.ripgrep.MSVC
winget install sharkdp.fd

# lazygit
winget install JesseDuffield.lazygit

# Node.js (pros LSPs ts_ls e basedpyright)
winget install OpenJS.NodeJS.LTS

# Python 3 (pro basedpyright resolver imports)
winget install Python.Python.3.12

# Clipboard: win32yank (Neovim no Windows precisa dele pro registro "+" funcionar)
winget install equalsraf.win32yank
```

Depois disso, instale uma **Nerd Font** (ex: `FiraCode Nerd Font`, `JetBrainsMono Nerd Font`) em
https://www.nerdfonts.com/font-downloads, e configure seu terminal (Windows Terminal, Alacritty,
etc.) para usá-la.

> Se o compilador C não estiver disponível, o `:TSUpdate` do treesitter falha silenciosamente.
> A forma mais simples no Windows costuma ser instalar o **MSYS2** e adicionar o `gcc` do
> `mingw-w64` ao PATH.

---

## Instalação no Linux

### Debian/Ubuntu (apt)

```bash
sudo apt update
sudo apt install -y neovim git build-essential ripgrep fd-find \
  nodejs npm python3 python3-pip xclip curl unzip tar

# lazygit não está nos repositórios padrão do apt, instale manualmente:
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

> No Ubuntu/Debian, o binário `fd` é instalado como `fdfind` — pode ser necessário criar um
> link simbólico: `ln -s $(which fdfind) ~/.local/bin/fd`.

### Fedora (dnf)

```bash
sudo dnf install -y neovim git gcc gcc-c++ make ripgrep fd-find \
  nodejs npm python3 python3-pip xclip curl unzip tar lazygit
```

### Arch (pacman)

```bash
sudo pacman -S --needed neovim git base-devel ripgrep fd \
  nodejs npm python python-pip xclip curl unzip tar lazygit
```

Se estiver no **Wayland**, troque `xclip` por `wl-clipboard`:

```bash
sudo apt install wl-clipboard        # Debian/Ubuntu
sudo dnf install wl-clipboard        # Fedora
sudo pacman -S wl-clipboard          # Arch
```

Depois, instale uma **Nerd Font** e configure seu terminal para usá-la (no Linux, os arquivos
`.ttf`/`.otf` normalmente vão em `~/.local/share/fonts`, seguido de `fc-cache -fv`).

---

## Pós-instalação (Windows e Linux)

1. Abra o `nvim` — o `lazy.nvim` vai se auto-instalar e baixar todos os plugins na primeira execução.
2. O Treesitter instala os parsers automaticamente (configurado em `treesitter.lua`), desde que o compilador C esteja disponível.
3. Instale os servidores LSP via Mason:
   ```vim
   :MasonInstall lua-language-server typescript-language-server basedpyright
   ```
4. Rode `:checkhealth` dentro do Neovim para confirmar que não falta nada (ele avisa sobre clipboard, provedores, treesitter, etc).

## Testando se está tudo certo

- `<leader>fg` (grep) deve funcionar → depende do `ripgrep`.
- `<C-p>` (buscar arquivos) deve funcionar rápido → depende do `fd`.
- `<leader>gg` deve abrir o lazygit.
- Ícones nas abas/statusline devem aparecer corretamente → depende da Nerd Font.
- `<leader>y` deve copiar pro clipboard do sistema (cole em outro app pra confirmar).
- Abrir um arquivo `.ts` ou `.py` deve mostrar diagnósticos do LSP.
