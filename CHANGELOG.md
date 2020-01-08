kali CHANGELOG
===============

This file is used to list changes made in each version of the kali cookbook.

2.1.0
-----
- Removed `kali::rogue-ap` recipe (moved in `pentester` cookbook)
- CI fixes

2.0.0
-----
- Removed support for Kali linux 1.0 & 2.0
- Add `kali::hud` recipe to deploy the kalihud script
- Add `[kali][upgrade]` attribute to upgrade metapackages
- Use https transport for kali repository
- Removed ohai plugin 
- Removed `kali_release` automatic attribute 

1.1.0
-----
- Add `kali::disable_lightdm` recipe

1.0.1
-----
- kali::openvas Do not setup openvas by default

1.0.0
-----
- Default setup for kali-rolling

0.3.1
-----
- Add `[kali][security_distribution]` attribute.

0.3.0
-----
- Add `kali_release` automatic attribute.

0.2.1
-----
- New recipe `kali::rogue-ap` to setup a Rogue AP

0.2.0
-----
- Support for Kali 2.0
- New attributes for apt repository
- Timeout attribute for packages installation 

0.1.1
-----
- Packages authentication with gpg signature

0.1.0
-----
- Initial release of kali cookbook
