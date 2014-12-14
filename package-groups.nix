{pkgs, ...}: with pkgs;
rec {

  audio = [
    nixpkgs.pulseaudioFull    
  ];

  vcs = [
    gitAndTools.gitFull
    mercurial
    subversion
  ];

  terminals = [
    rxvt_unicode
    xterm
  ];

  py27 = [
    pythonFull
    python27Packages.chameleon
    python27Packages.colander
    python27Packages.deform
    python27Packages.ipython
    python27Packages.jinja2
    python27Packages.lxml
    python27Packages.pyramid
    python27Packages.sphinx
    python27Packages.sqlite3
    python27Packages.virtualenv
    python27Packages.epc
    python27Packages.jedi
    python27Packages.markdown
    python27Packages.readline
    python27Packages.recursivePthLoader
    python27Packages.rope
  ];

  py34 = [
    python34Packages.chameleon
    python34Packages.colander
    python34Packages.deform
    python34Packages.ipython
    python34Packages.jinja2
    python34Packages.lxml
    python34Packages.pyramid
    python34Packages.sphinx
    python34Packages.sqlite3
    python34Packages.virtualenv
    python34Packages.epc
    python34Packages.jedi
    python34Packages.markdown
    python34Packages.readline
    python34Packages.recursivePthLoader
  ];

  py = py27 ++ py34 ++ [pylint];

  haskellXmonadPkgs = [
    haskellPackages.haskellPlatform
    haskellPackages.xmobar
    haskellPackages.xmonad
    haskellPackages.xmonadContrib
    haskellPackages.xmonadExtras
    haskellPackages_ghc763_profiling.xmonad
    haskellPackages_ghc763_profiling.xmonadContrib
    haskellPackages_ghc763_profiling.xmonadExtras
    haskellPackages.cabalInstall
  ];

  gimpExtras = with gimpPlugins; [
    exposureBlend
    fourier
    gimplensfun
    gmic
    lightning
    lqrPlugin
    resynthesizer
    texturize
    ufraw
    waveletSharpen
  ];

  xsaneGimp = xsane.override { gimpSupport = true; };

  graphics = [
    darktable
    gimp_2_8
    gimpExtras
    gutenprint
    imagemagick
    inkscape
    mypaint
    saneFrontends
    saneBackends
    xsaneGimp
  ];

  multimedia = [
    vlc
    vorbisTools 
    minidlna
  ];

  misc = [
    freetype
    libjpeg
    libmtp
    libpng
    libtiff
    libXaw
    libXpm
    mtpfs
    ykpers
    zlib
  ]; 

  database = [
    postgresql93
  ];

  filesystem = [
    smbnetfs
  ];

  text = [
    aspell
    aspellDicts.en
    corefonts
    emacs24
    mupdf
    offlineimap
    notmuch
  ];

  genericUtils = [
    gnupg
    gptfdisk
    lsof
    openssl
    openvpn
    pinentry
    pmount
    screen
    shared_mime_info
    sshfsFuse
    which
  ];

  compressionUtils = [
    gnutar
    unrar
    unzip
    xz
    zip
  ];

  internet = [
    chromium
    curl
    dmenu
    firefox
    gnome.gnome_keyring
    lftp
    mumble
    skype
    stalonetray
    thunderbird
    trayer
    w3m
    wget
  ];

  communications = [
    gajim
    xchat
  ];

  fonts = [
    xfontsel
    xlsfonts
  ];

  X = [
    feh
    keymon
    mesa
    xclip
    xfce.xfce4_power_manager 
    xkeyboard_config
    xlibs.xev
    xlibs.xkbcomp
    xlibs.xmessage
    xlibs.xmodmap
    xscreensaver
    xsel
  ];

  sysUtils = [
    acpi
    acpitool
    cryptsetup
    dbus_tools
    gcc
    gnumake
    gnupg1orig
    guile
    inotifyTools
    kvm
    openvpn
    unetbootin
    vde2
  ];

  # Not used (using plain xmonad)
  kde4Packages = [
    kde4.kdemultimedia
    kde4.kdegraphics
    kde4.kdeutils
    kde4.applications
    kde4.kdegames
    kde4.kdeedu
    kde4.kdebindings
    kde4.kdeaccessibility
    kde4.kde_baseapps
    kde4.kactivities
    kde4.kdeadmin
    kde4.kdeartwork
    kde4.kde_base_artwork
    kde4.kdenetwork
    kde4.kdepim
    kde4.kdepimlibs
    kde4.kdeplasma_addons
    kde4.kdesdk
    kde4.kdetoys
    kde4.kde_wallpapers
    kde4.kdewebdev
    kde4.oxygen_icons
    kde4.kdebase_workspace
    kde4.kdelibs
    kde4.kdevelop
    kde4.kdevplatform
  ];

  desktop = internet ++ graphics ++ multimedia ++ X ++ haskellXmonadPkgs ++ terminals;
  dev = vcs ++ text ++ py ++ filesystem ++ database;
  utils = sysUtils ++ compressionUtils ++ genericUtils;
}
