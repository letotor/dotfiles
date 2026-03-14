#!/bin/bash

# Affiche les raccourcis i3 via rofi — thème Tokyo Night
KEYS="
<span color='#7aa2f7' font_weight='bold'>  Fenêtres</span>
<span color='#a9b1d6'>Super + Entrée</span>         <span color='#737aa2'>Terminal (kitty)</span>
<span color='#a9b1d6'>Super + d</span>              <span color='#737aa2'>Launcher (Rofi)</span>
<span color='#a9b1d6'>Super + Shift + q</span>      <span color='#737aa2'>Fermer fenêtre</span>
<span color='#a9b1d6'>Super + f</span>              <span color='#737aa2'>Plein écran</span>
<span color='#a9b1d6'>Super + Shift + Space</span>  <span color='#737aa2'>Basculer flottant</span>
<span color='#a9b1d6'>Super + Space</span>          <span color='#737aa2'>Focus flottant/tiling</span>
<span color='#a9b1d6'>Super + q</span>              <span color='#737aa2'>Focus parent</span>
<span color='#7aa2f7' font_weight='bold'>  Mise en page</span>
<span color='#a9b1d6'>Super + h/v</span>            <span color='#737aa2'>Split horizontal/vertical</span>
<span color='#a9b1d6'>Super + s</span>              <span color='#737aa2'>Layout stacking</span>
<span color='#a9b1d6'>Super + z</span>              <span color='#737aa2'>Layout tabbed</span>
<span color='#a9b1d6'>Super + e</span>              <span color='#737aa2'>Layout toggle split</span>
<span color='#a9b1d6'>Super + r</span>              <span color='#737aa2'>Mode redimensionnement</span>
<span color='#7aa2f7' font_weight='bold'>  Focus / Déplacement</span>
<span color='#a9b1d6'>Super + j/k/l/m</span>        <span color='#737aa2'>Focus gauche/bas/haut/droite</span>
<span color='#a9b1d6'>Super + Shift + j/k/l/m</span> <span color='#737aa2'>Déplacer fenêtre</span>
<span color='#7aa2f7' font_weight='bold'>  Workspaces</span>
<span color='#a9b1d6'>Super + 1..9</span>           <span color='#737aa2'>Aller workspace 1-9</span>
<span color='#a9b1d6'>Super + Shift + 1..9</span>   <span color='#737aa2'>Envoyer vers workspace 1-9</span>
<span color='#7aa2f7' font_weight='bold'>  Applications</span>
<span color='#a9b1d6'>Super + Shift + f</span>      <span color='#737aa2'>Nautilus (fichiers)</span>
<span color='#a9b1d6'>F1</span>                     <span color='#737aa2'>Qobuz (navigateur)</span>
<span color='#9ece6a'>F2</span>                     <span color='#737aa2'>btop (moniteur système)</span>
<span color='#7aa2f7' font_weight='bold'>  Captures d'écran</span>
<span color='#a9b1d6'>Impr</span>                   <span color='#737aa2'>Screenshot plein écran → fichier</span>
<span color='#a9b1d6'>Shift + Impr</span>           <span color='#737aa2'>Screenshot sélection (GUI)</span>
<span color='#a9b1d6'>Ctrl + Impr</span>            <span color='#737aa2'>Screenshot écran actif</span>
<span color='#a9b1d6'>Super + Impr</span>           <span color='#737aa2'>Screenshot région annotée</span>
<span color='#7aa2f7' font_weight='bold'>  i3</span>
<span color='#a9b1d6'>Super + Shift + c</span>      <span color='#737aa2'>Recharger config</span>
<span color='#a9b1d6'>Super + Shift + r</span>      <span color='#737aa2'>Redémarrer i3</span>
<span color='#f7768e'>Super + Shift + e</span>      <span color='#737aa2'>Quitter i3</span>
"

echo "$KEYS" | rofi \
  -dmenu \
  -markup-rows \
  -p "󰌌  keys" \
  -no-custom \
  -theme-str '
    * {
      bg0:              #1a1b26;
      bg1:              #1f2335;
      bg2:              #24283b;
      bg3:              #414868;
      fg0:              #c0caf5;
      fg2:              #737aa2;
      blue:             #7aa2f7;
      font:             "Victor Mono 10";
      background-color: transparent;
      text-color:       #c0caf5;
    }
    window {
      width:            680px;
      background-color: @bg1;
      border:           1px solid;
      border-color:     @bg3;
      border-radius:    10px;
    }
    mainbox {
      spacing:  0;
      children: [ inputbar, listview ];
    }
    inputbar {
      padding:          10px 16px;
      background-color: @bg0;
      border-radius:    10px 10px 0px 0px;
      border-color:     @bg3;
      border:           0px 0px 1px 0px solid;
      children:         [ prompt ];
    }
    prompt {
      text-color: @blue;
      font:       "Victor Mono Bold 11";
    }
    listview {
      lines:            28;
      columns:          1;
      scrollbar:        false;
      padding:          8px 4px;
      background-color: @bg1;
      border-radius:    0px 0px 10px 10px;
    }
    element {
      padding:          3px 16px;
      background-color: @bg1;
      border-radius:    6px;
    }
    element normal normal {
      background-color: @bg1;
      text-color:       @fg0;
    }
    element alternate normal {
      background-color: @bg1;
      text-color:       @fg0;
    }
    element selected normal {
      background-color: @bg2;
      text-color:       @fg0;
      border:           0px 0px 0px 2px solid;
      border-color:     @blue;
    }
    element-text {
      background-color: inherit;
      text-color:       inherit;
    }
  '
