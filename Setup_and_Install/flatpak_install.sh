#!/usr/bin/bash

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y \
  org.gimp.GIMP \
  ca.desrt.dconf-editor \
  com.github.johnfactotum.Foliate \
  dev.geopjr.Collision \
  io.github.zefr0x.hashes \
  com.github.hugolabe.Wike \
  com.github.rafostar.Clapper \
  com.konstantintutsch.Lock \
  io.podman_desktop.PodmanDesktop \
  com.collaboraoffice.Office \
  io.gitlab.liferooter.TextPieces \
  me.iepure.devtoolbox \
  org.nickvision.tubeconverter \
  page.tesk.Refine \
  com.mattjakeman.ExtensionManager \
  com.github.marhkb.Pods \
  com.belmoussaoui.Decoder \
  be.alexandervanhee.gradia \
  app.drey.Dialect \
  app.drey.Damask \
  com.toolstack.Folio \
  com.vscodium.codium \
  com.vixalien.sticky \
  md.obsidian.Obsidian \
  org.gnome.World.PikaBackup \
  io.github.alainm23.planify \
  com.belmoussaoui.Authenticator \
  org.keepassxc.KeePassXC \
  com.github.PintaProject.Pinta \
  org.gnome.Builder \
  io.github.getnf.embellish
