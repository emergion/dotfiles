# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Decrypt root FS
  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/nvme0n1p2";
      preLVM = true;
    }
  ];

  networking.hostName = "xps-13"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  powerManagement.enable = true;
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

   #Select internationalisation properties.
   i18n = {
     consoleFont = "sun12x22";
     consoleKeyMap = "us";
     defaultLocale = "en_AU.UTF-8";
   };

   users.extraUsers.pmyjavec = {
   	createHome = true;
	extraGroups = ["wheel" "video" "audio" "disk" "networkmanager"];
	group = "users";
	home = "/home/pmyjavec";
	isNormalUser = true;
	uid = 1000;
	shell = pkgs.zsh;

   };

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     curl
     wget 
     neovim
     terraform
     ansible
     firefox
     nmap
     ruby
     python
     git
     htop
     vagrant
     which
     nix-repl
     kitty
     tmux
     zsh
     tdesktop
     spotify
     slack
     pavucontrol
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true; 

  # Enable sound.
  sound.enable = true;
  hardware.bluetooth.enable = true;

  hardware.pulseaudio = {
    enable = true;
    # NixOS allows either a lightweight build (default) or full build of PulseAudio to be installed.
    # Only the full build has Bluetooth support, so it must be selected here.
    package = pkgs.pulseaudioFull;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.dpi = 220;
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  #
  services.xserver.displayManager.sddm.enable = false;
  services.xserver.desktopManager.plasma5.enable = false;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.xkbOptions = "caps:ctrl_modifier, terminate:ctrl_alt_bksp"; #, altwin:ctrl_win";`

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; 

  fonts.fonts = with pkgs; [
    source-code-pro
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
   ];

  services.redshift = {
    enable = true;
    provider = "geoclue2";
  }; 

  nixpkgs.config = {
    allowUnfree = true;
  };

}
