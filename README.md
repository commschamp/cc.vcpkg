# Overview
This repository is intended to be used as [ports overlay](https://github.com/microsoft/vcpkg/blob/master/docs/specifications/ports-overlay.md) directory or as [custom registries](https://learn.microsoft.com/en-us/vcpkg/users/registries) of the [vcpkg](https://github.com/microsoft/vcpkg) package manager. It provides latest versions of the [CommsChampion Ecosystem](https://commschamp.github.io/) repositories.

# Provided Ports

- [cc-comms](cc-comms) - Port of the [COMMS Library](https://github.com/commschamp/comms).
- [cc-commsdsl](cc-commsdsl) - Port of the [commsdsl](https://github.com/commschamp/commsdsl) code generators.
- [cc-mqtt311](cc-mqtt311) - Port of the [cc.mqtt311.generated](https://github.com/commschamp/cc.mqtt311.generated).
- [cc-mqtt5](cc-mqtt5) - Port of the [cc.mqtt5.generated](https://github.com/commschamp/cc.mqtt5.generated).
- [cc-mqttsn](cc-mqttsn) - Port of the [cc.mqttsn.generated](https://github.com/commschamp/cc.mqttsn.generated).
- [cc-mqttsn-libs](cc-mqttsn-libs) - Port of the [cc.mqttsn.libs](https://github.com/commschamp/cc.mqttsn.libs).
- [cc-ublox](cc-ublox) - Port of the [cc.ublox.generated](https://github.com/commschamp/cc.ublox.generated).
- [cc-x509](cc-x509) - Port of the [cc.x509.generated](https://github.com/commschamp/cc.x509.generated).

# vcpkg-configuration.json

To use this registry, you have to follow the instructions mentioned in [custom registries](https://learn.microsoft.com/en-us/vcpkg/users/registries). 
Usually you will use something as the following:
```json
{
    "default-registry": {
        "kind": "git",
        "repository": "https://github.com/Microsoft/vcpkg",
        "baseline": "<commit_sha_vcpkg>"
    },
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/commschamp/cc.vcpkg",
            "baseline": "<commit_sha_cc.vcpkg>",
            "packages": [
                "cc-*"
            ]
        }
    ]
}
```

# How-To releasing

1. increase the versions in the ports/ directory.
2. commit changes
3. run `vcpkg=<path_to_vcpkg_executable>` ./add_versions.sh
4. commit changes
