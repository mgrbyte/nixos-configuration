{
  allowUnfree = true;

  firefox = {
    enableAdobeFlash = true;
  };

  firefoxWrapper = {
    enableAdobeFlash = true;
  };

  chromium = {
    # Chromium's non-NSAPI alternative to Adobe Flash
    enablePepperFlash = true;
    enablePepperPDF = true;
  };

  programs.bash.enableCompletion = true;
 
  packageOverrides = pkgs: with pkgs; {
    python34Env = pkgs.myEnvFun {
        name = "python34";
        buildInputs = [
          git
          libxml2
          libxslt
          libzip
          python34
          python34Packages.readline
          python34Packages.virtualenv
          # python34Packages.pyramid
          # python34Packages.jinja2
          # python34Packages.chameleon
          # python34Packages.colander
          # python34Packages.deform
          # python34Packages.sqlalchemy9
          # python34Packages.virtualenv
          # python34Packages.zodb
          # python34Packages.zodburi
          # python34Packages.zc_buildout_nix
          readline
          stdenv
          zlib
        ];
        extraCmds = ''
          export _PYTHONPATH="$PYTHONPATH"
          export _PYTHONHOME="$PYTHONHOME"
          export PYTHONHOME="${python34}"
	  unset PYTHONPATH
          alias python="${python}/bin/python"
          unset http_proxy
        '';
    };
 
    python27Env = pkgs.myEnvFun {
       name = "python27";
       buildInputs = [
         git
         lessc
         libxml2
         libxslt
         libzip
         python27Full
         python27Packages.pip
         python27Packages.readline
         python27Packages.virtualenv
         # python27Packages.pyramid
         # python27Packages.jinja2
         # python27Packages.chameleon
         # python27Packages.colander
         # python27Packages.deform
         # python27Packages.sqlalchemy9
         # python27Packages.virtualenv
         # python27Packages.zodb
         # python27Packages.zodburi
         # python27Packages.zc_buildout_nix
         stdenv
         zlib
       ];
       extraCmds = ''
         export _PYTHONPATH="$PYTHONPATH"
	 export _PYTHONHOME="$PYTHONHOME"
         export PYTHONHOME="${python27}"
         unset http_proxy
       '';
    };
   };
}
