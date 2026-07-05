# SharedMedia: AlertMediaPack

SharedMedia: AlertMediaPack is a curated sound pack for World of Warcraft addons using LibSharedMedia-3.0.

It registers a curated set of alert-ready sounds for compatible UI addons such as WeakAuras, Plater, BigWigs, DBM, Details, ElvUI and other addons that read media from LibSharedMedia.

## Install

Copy the `SharedMedia_AlertMediaPack` folder into:

```text
World of Warcraft/_retail_/Interface/AddOns/
```

Then enable **SharedMedia: AlertMediaPack** in the in-game addon list.

## Requirement

This addon registers media through `LibSharedMedia-3.0`.

It does not bundle LibSharedMedia itself. CurseForge packaging declares `LibSharedMedia-3.0` as a required dependency. For manual installs, install `LibSharedMedia-3.0` separately if none of your addons already provide it.

## Compatibility

The addon registers standard LibSharedMedia sound entries only. Any addon that reads `sound` media from LibSharedMedia can use the included alerts, including WeakAuras, Plater, BigWigs, DBM, Details, ElvUI and other compatible UI addons.

The `.toc` declares the Retail and Classic-family interface versions present in the local `LibSharedMedia-3.0` package, plus the existing Retail 11.2.0 interface value.

## Included sounds

- Air Horn
- Alert Toast Warm
- Applause
- Blast
- Bleat
- Boxing Arena Gong
- Cartoon Voice Baritone
- Cartoon Walking
- Cat Meow
- Cow Mooing
- Focus
- Heartbeat Single
- Kitten Meow
- Lossa Healer Trinket
- Lossa Trinket
- Notification 18
- Notification 38
- Ringing Phone
- Roaring Lion
- Robot Blip
- Sheep Bleat
- Shotgun
- Sonar
- Temple Bell
- Torch
- Warning Siren
- Watch Out
- Water Drop

## Licensing

The Lua code in this addon is licensed under the MIT License.

Bundled media files keep their original upstream licenses:

- `HeartbeatSingle.ogg`: Creative Commons CC0 1.0
- WeakAuras-derived bundled `.ogg` files: Creative Commons Attribution 3.0
- `LossaHealerTrinket.ogg` and `LossaTrinket.ogg`: MIT via sArena Reloaded
- Anahkas alert sounds from Externals On Me / HealerCC: author-provided media

See `Licenses/ATTRIBUTION.md`, `Licenses/CC0-1.0.txt`, `Licenses/CC-BY-3.0.txt`, `Licenses/WeakAuras-Provided-by.txt`, `Licenses/sArena_Reloaded-MIT.txt`, and `Licenses/Anahkas-Provided-by.txt`.

## Upstream notice

The original set of media files was extracted from the WeakAuras 5.21.1 package, from `WeakAuras/Media/Sounds`, and only files with CC0 or CC BY 3.0 entries in WeakAuras' `Provided by.txt` were included.

Additional alert-focused sounds were added from local addons after license and usage review:

- Externals On Me / HealerCC: Anahkas-provided alert sounds.
- sArena Reloaded: MIT-licensed trinket alert sounds.

SharedMedia: AlertMediaPack is unofficial and is not affiliated with WeakAuras, Wago, Blizzard Entertainment, or any listed compatible addon.

## CurseForge release

Releases are packaged by CurseForge from Git tags. The `.pkgmeta` file defines the package name, LibSharedMedia dependency and changelog file.

Configure automatic packaging in the CurseForge project, then push version tags such as `1.0.0`. The packager uses the tag value for `@project-version@`.
