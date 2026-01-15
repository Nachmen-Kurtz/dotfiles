#!/usr/bin/bash

# TODO:
# Defin function in the script to install require apps and optional apps.
# 1. Require apps contain a list of core useg apps (Obsidian, Planify, etc.)
# 2. Optional Apps contain a list of apps no core (like Damask, IPLookup, etc.)

flatpak install flathub \
  app.drey.Damask \
  md.obsidian.Obsidian \
  org.nickvision.tubeconverter \
  org.gnome.World.PikaBackup \
  io.gitlab.news_flash.NewsFlash \
  app.drey.Dialect \
  org.gnome.Extensions \
  org.gnome.Music \
  org.gnome.Papers \
  com.vixalien.sticky \
  io.bassi.Amberol \
  io.github.alainm23.planify \
  io.github.alescdb.mailviewer \
  com.github.jeromerobert.pdfarranger \
  org.gnome.gitlab.YaLTeR.VideoTrimmer \
  com.bitwarden.desktop \
  dev.bragefuglseth.Keypunch \
  io.github.diegoivan.pdf_metadata_editor \
  com.rafaelmardojai.Blanket \
  io.github.fizzyizzy05.binary \
  org.gnome.gitlab.cheywood.Pulp \
  io.github.flattool.Warehouse \
  com.belmoussaoui.Decoder \
  io.github.david_swift.Flashcards \
  io.github.zefr0x.hashes \
  com.belmoussaoui.Authenticator \
  io.github.bytezz.IPLookup \
  dev.geopjr.Collision \
  com.mattjakeman.ExtensionManager \
  com.konstantintutsch.Lock \
  io.github.ronniedroid.concessio \
  io.github.vmkspv.netsleuth \
  com.belmoussaoui.Obfuscate \
  dev.geopjr.Calligraphy \
  io.gitlab.liferooter.TextPieces \
  fr.romainvigier.MetadataCleaner \
  io.github.tfuxu.floodit \
  com.github.tchx84.Flatseal \
  com.logseq.Logseq \
  -y

