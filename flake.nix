{
  description = "Basic template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" ];
      forEachSystem = f: nixpkgs.lib.genAttrs  systems (system: f system);
    in
  {
    devShells = forEachSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        mkScript = name: text: let
          script = pkgs.writeShellScriptBin name text;
        in script;
        scripts = [
          (mkScript "up" ''docker compose up -d'')
          (mkScript "down" ''docker compose down --timeout 0'')
          (mkScript "k" ''kubectl "$@"'')
          (mkScript "m" ''minikube "$@"'')
          (mkScript "i" ''istioctl "$@"'')
        ];
      in {
        default = pkgs.mkShell {
          packages = with pkgs; [
            zulu
            maven
            kubernetes
            minikube
            kubernetes-helm
            istioctl
          ] ++ scripts;
        };
      });
  };
}
