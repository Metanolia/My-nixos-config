{
  description = "Мой NixOS конфиг";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
};

  outputs = { self, nixpkgs, ... }
@inputs: {
    nixosConfigurations = {
        # Мой ноутбук
      my-laptop =
nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/my-laptop.nix ];
                                  };

        # Заготовка для родителей
        parents-pc = 
nixpkgs.lib.nixosSystem { 
        system = "x86_64-linux";
        modules = [ ./hosts/parents-pc.nix ];
      };
    };
  };
}
