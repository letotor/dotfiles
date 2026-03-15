# dotfiles — Tokyo Night

Configuration personnelle pour i3 sous Fedora.
Thème : **Tokyo Night** sur l'ensemble du bureau.

---

## Aperçu

![Desktop](screenshots/desktop.png)

---

## Stack

| Composant       | Outil                  |
|-----------------|------------------------|
| Window manager  | i3                     |
| Bar             | Polybar                |
| Launcher        | Rofi                   |
| Notifications   | Dunst                  |
| Terminal        | Alacritty              |
| Police          | Victor Mono            |
| Icônes          | Font Awesome 6         |
| Compositor      | Picom                  |
| Verrouillage    | i3lock + blur          |
| Thème GTK       | Catppuccin Mocha Mauve |

---

## Polybar

![Polybar](screenshots/polybar.png)

- Workspaces i3 à gauche
- Date/heure au centre
- Modules à droite : `keybindings` `screenshot` `volume` `RAM` `CPU` `wifi` `batterie`
- Icônes Font Awesome colorées par type (violet, bleu, rouge, vert)

---

## Rofi

Thème custom `tokyonight.rasi` :
- Fond `#1a1b26` / `#1f2335`
- Bordure bleue `#7aa2f7` 2px
- Police Victor Mono Medium 12
- Coins arrondis 14px

---

## Dunst

![Dunst](screenshots/dunst.png)

Notifications Tokyo Night par urgence :

| Urgence   | Bordure         | Timeout  |
|-----------|-----------------|----------|
| Low       | `#414868`       | 4s       |
| Normal    | `#7aa2f7` bleu  | 6s       |
| Critical  | `#f7768e` rouge | jamais   |

---

## Keybindings (menu polybar)

Clic sur `⌨ keys` dans la polybar → menu rofi Tokyo Night avec tous les raccourcis i3 colorisés par section.

Raccourcis notables :
- `F1` → Qobuz
- `F2` → btop (moniteur système)
- `Super + d` → Rofi launcher
- `Ctrl + L` → Verrouillage écran

---

## Écran de verrouillage

Script `bin/lock.sh` — capture l'écran, applique un blur Gaussian (ImageMagick), puis lance `i3lock`.

> L'image de fond personnalisée (`lockscreen.png`) n'est pas trackée dans ce repo (fichier lourd ~6 Mo).
> Placer l'image dans `~/Pictures/lockscreen.png` pour l'utiliser avec `betterlockscreen -u ~/Pictures/lockscreen.png`.

---

## Thème système (Fedora / GNOME)

Paramètres exportés dans `config/dconf/desktop.conf` :
- GTK : `catppuccin-mocha-mauve-standard+default`
- Mode sombre activé
- Accent : `purple`

Restaurer avec :
```bash
dconf load /org/gnome/desktop/interface/ < config/dconf/desktop.conf
```

---

## Scripts (`bin/`)

| Script               | Rôle                                      |
|----------------------|-------------------------------------------|
| `lock.sh`            | Verrouillage avec blur i3lock             |
| `resume-monitors.sh` | Relance xrandr après réveil veille        |
| `polybar-ip.sh`      | Affiche l'IP locale dans la polybar       |
| `keybindings.sh`     | Menu rofi des raccourcis i3               |

---

## Installation

```bash
git clone https://github.com/letotor/dotfiles.git
cd dotfiles

# Copier les configs
cp -r .config/i3       ~/.config/i3
cp -r .config/polybar  ~/.config/polybar
cp -r .config/rofi     ~/.config/rofi
cp -r config/dunst        ~/.config/dunst
cp -r config/alacritty    ~/.config/alacritty
cp bin/lock.sh            ~/bin/lock.sh
cp bin/resume-monitors.sh ~/bin/resume-monitors.sh
cp bin/polybar-ip.sh      ~/bin/polybar-ip.sh
cp bin/keybindings.sh     ~/bin/keybindings.sh
chmod +x ~/bin/*.sh

# Restaurer le thème GNOME/GTK
dconf load /org/gnome/desktop/interface/ < config/dconf/desktop.conf
```

---

## Palette Tokyo Night

```
bg0  #1a1b26   bg1  #1f2335   bg2  #24283b   bg3  #414868
fg0  #c0caf5   fg2  #737aa2
blue #7aa2f7   red  #f7768e   green #9ece6a   yellow #e0af68
```
