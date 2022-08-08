# [0.13.0](https://github.com/checkip/checkip/compare/v0.12.0...v0.13.0) (2022-08-08)


### Bug Fixes

* **core:** verify geo data existence ([#19](https://github.com/checkip/checkip/issues/19)) ([b25037c](https://github.com/checkip/checkip/commit/b25037c558615bd898d702ae2e62e921236b76f2))


### Features

* **core:** upgrade to ruby 3.1.2 ([#17](https://github.com/checkip/checkip/issues/17)) ([1b5e7b8](https://github.com/checkip/checkip/commit/1b5e7b81fb2b50656dc475fc3aaab222a155eca8))



# [0.12.0](https://github.com/checkip/checkip/compare/v0.11.0...v0.12.0) (2022-05-02)


### Features

* **core:** configurable geolocation provider ([#8](https://github.com/checkip/checkip/issues/8)) ([ddd7fce](https://github.com/checkip/checkip/commit/ddd7fce6667f40afd5fd57d7fa84e1fad918cea4))
* **core:** upgrade to ruby 3.0.4 ([#15](https://github.com/checkip/checkip/issues/15)) ([52765b9](https://github.com/checkip/checkip/commit/52765b995c5715d79882a9e800a1afae8bc85b6e))



# [0.11.0](https://github.com/checkip/checkip/compare/v0.10.0...v0.11.0) (2022-01-27)


### Bug Fixes

* **i18n:** remove unused key ([0450b3a](https://github.com/checkip/checkip/commit/0450b3a2864330de6c82cc08f98964d7f1914c91))


### Features

* **core:** upgrade to rails 7.0.1 ([41a321c](https://github.com/checkip/checkip/commit/41a321cc89b97d1139d705db49eb8a3ff9dbdb53))
* **core:** upgrade to ruby 3.0.3 ([#4](https://github.com/checkip/checkip/issues/4)) ([00a533f](https://github.com/checkip/checkip/commit/00a533ff8a62df103621a3d504f2119f9baa922d))
* **core:** use lograge ([#5](https://github.com/checkip/checkip/issues/5)) ([ac3976e](https://github.com/checkip/checkip/commit/ac3976ec118e19e99fc4bbaea725f82bd9118320))
* **ux:** copy to clipboard button for the ip data ([13c9dde](https://github.com/checkip/checkip/commit/13c9dde45b1756eaf940be8b940401b2c0752bea))
* **ux:** new favicon ([#6](https://github.com/checkip/checkip/issues/6)) ([5ee6af4](https://github.com/checkip/checkip/commit/5ee6af4427fe61e8e8b13a034c787ef1fb0f7270))
* **ux:** new navigation with drawer ([0bcb882](https://github.com/checkip/checkip/commit/0bcb8829037acd2d2121edfbe3e6638100cea3a8))
* **ux:** update title style ([718bd43](https://github.com/checkip/checkip/commit/718bd43e4eb9dddaddfe87ef8df5db4030ceb6dc))
* **ux:** upgrade to material-components-web v13.0.0 ([b1be558](https://github.com/checkip/checkip/commit/b1be558e0b80008aca70885beb28a9171ea8bd7d))



# [0.10.0](https://github.com/checkip/checkip/compare/v0.9.0...v0.10.0) (2021-09-18)


### Features

* **api:** asn endpoint returns json ([918f220](https://github.com/checkip/checkip/commit/918f2203d6de58ba4a50a0ce1d3fe29de840e222))
* **api:** handle json header on main page ([fd4b523](https://github.com/checkip/checkip/commit/fd4b5239cce9acdb2ee7651bd644c906bdf98bff))
* **core:** detect faraday ([c019881](https://github.com/checkip/checkip/commit/c019881328861dd6d76dd063f48781e1d8debe31))
* **ux:** add service description to main page ([13678ce](https://github.com/checkip/checkip/commit/13678ce633c130d6933e4286248d4f7d8c544431))
* **ux:** style service description ([3e9b33a](https://github.com/checkip/checkip/commit/3e9b33a5182fda28d57632364e50e3e704e9087f))
* **ux:** update footer ([c73b9ce](https://github.com/checkip/checkip/commit/c73b9ce8f4cd3cf3803956105f3c6239f347e709))
* **ux:** update grid layout ([1fc648c](https://github.com/checkip/checkip/commit/1fc648c9cc2f63381839375b328bd9709d1f9069))
* **ux:** update style for main page headers ([61aee93](https://github.com/checkip/checkip/commit/61aee9320f5f9fa4988ee6616e750fc3ddbf09e5))



# [0.9.0](https://github.com/checkip/checkip/compare/v0.8.0...v0.9.0) (2021-09-10)


### Bug Fixes

* **core:** replace removed methods in the health check ([12e6af7](https://github.com/checkip/checkip/commit/12e6af782981d28e5f9294cf5169757eb15c9afb))


### Features

* **api:** endpoint for user-agent ([b20b981](https://github.com/checkip/checkip/commit/b20b98104785e95acbe0083c15b8d25f1e1f4804))
* **core:** detect go-http-client ([3231066](https://github.com/checkip/checkip/commit/3231066eb38eb19638b4900b8c3ac803134500aa))
* **core:** new health check ([0019e34](https://github.com/checkip/checkip/commit/0019e34f8066d8cd2f5a59575442b283161e0872))
* **core:** style json on health check ([4d0bfdd](https://github.com/checkip/checkip/commit/4d0bfddd5e9842526a0698eec5bfd460ed2494d4))
* **core:** update mmdb reader ([6c90940](https://github.com/checkip/checkip/commit/6c90940de271c7206e83dd5265ea592ffa44d81e))


### Performance Improvements

* **core:** prevent multiple db lookups ([956573b](https://github.com/checkip/checkip/commit/956573b5ef4d53fdd817956d034f4b7837416477))



# [0.8.0](https://github.com/checkip/checkip/compare/v0.7.0...v0.8.0) (2021-08-23)


### Features

* **ux:** tooltips for icon buttons ([c21e5b0](https://github.com/checkip/checkip/commit/c21e5b09fd1f4b57c07c606ec3ecb1d70577a0f2))
* **ux:** update checker data background ([73de3d2](https://github.com/checkip/checkip/commit/73de3d2228be0ed1d048e6ff238cf5e195cbe602))
* **ux:** update doc-api page style ([bc5a4ee](https://github.com/checkip/checkip/commit/bc5a4ee7e376ee23cc50d1cec5515cddd32dbfb3))
* **ux:** update top app bar ([8410e40](https://github.com/checkip/checkip/commit/8410e40f938270b4dfa56e9f177dbb96a24db896))


### Performance Improvements

* **core:** create maxminddb object only once ([deddc70](https://github.com/checkip/checkip/commit/deddc70080bf0ffeab0f3012213d5ea71f0dff82))



# [0.7.0](https://github.com/checkip/checkip/compare/v0.6.0...v0.7.0) (2021-08-13)


### Features

* **api:** api docs and examples ([b18164b](https://github.com/checkip/checkip/commit/b18164b645c936d4cd7e57c0da4dbd8cfab909ea))
* **api:** initial api ([b1da65f](https://github.com/checkip/checkip/commit/b1da65f1ac95ac4034b2a01723ed7a6136045e02))
* **ux:** upgrade to material-components-web v12.0.0 ([6cfd04f](https://github.com/checkip/checkip/commit/6cfd04f1637e7b28b92b6b03dfadb5e9722a2cd8))



# [0.6.0](https://github.com/checkip/checkip/compare/v0.5.0...v0.6.0) (2021-07-27)


### Features

* **core:** checker object set as hash ([fc7025e](https://github.com/checkip/checkip/commit/fc7025ec16e7f1794472ccfec5b8cfebc4bac9da))
* **core:** cli detection ([7ddbe0a](https://github.com/checkip/checkip/commit/7ddbe0a907ca0b9a89d4f5a5c0907748a3302b26))
* **core:** health check ([213f487](https://github.com/checkip/checkip/commit/213f4871188c6bf1f6327bea1db66cfbc36f84fb))



# [0.5.0](https://github.com/checkip/checkip/compare/v0.4.0...v0.5.0) (2021-07-19)


### Features

* **core:** single env for mmdb files path ([55ccf40](https://github.com/checkip/checkip/commit/55ccf402e06170a58f69ded2a88f932f0e445da2))
* **core:** work in limited mode without db ip files ([8cc75de](https://github.com/checkip/checkip/commit/8cc75de6693f28bb5a22f8f199ece872fbd2046d))
* **infrastructure:** env based puma configuration ([ec981cc](https://github.com/checkip/checkip/commit/ec981cc654ccbea87b01de80d610118f5775e564))
* **infrastructure:** integrate capistrano deploy ([6be7631](https://github.com/checkip/checkip/commit/6be763109d0832c1c8c9767630b4af3d209da4eb))
* **infrastructure:** rake task to fetch ip databases ([72d4f92](https://github.com/checkip/checkip/commit/72d4f92bafc18ab3ebe55993d11eb14bc5413ec1))
* **infrastructure:** restore original ip from cloudflare ([1d20c43](https://github.com/checkip/checkip/commit/1d20c430a00e039708588a56610fcfb1967069d5))



# [0.4.0](https://github.com/checkip/checkip/compare/v0.3.0...v0.4.0) (2021-07-18)


### Bug Fixes

* **ux:** update scss paths ([71a795c](https://github.com/checkip/checkip/commit/71a795cf50e442a970611dbeed0805899de7d300))


### Features

* **core:** base meta tags ([e756396](https://github.com/checkip/checkip/commit/e7563963024f43754f49dba44d8445d1a17e6770))
* **core:** upgrade to ruby 3.0.2 ([c09ac8c](https://github.com/checkip/checkip/commit/c09ac8c8a0c2b5f11cca36ae97034704c62189ae))
* **i18n:** base i18n support ([17a207d](https://github.com/checkip/checkip/commit/17a207d5d2b0c25878925f6fc5014f6f5a65554c))



# [0.3.0](https://github.com/checkip/checkip/compare/v0.2.0...v0.3.0) (2021-03-29)


### Features

* **ux:** highlight json data ([259d97c](https://github.com/checkip/checkip/commit/259d97ce62f06ae52cccdba4df9a3e4520e16bf0))
* **ux:** remove normalize dependency ([2f94d5f](https://github.com/checkip/checkip/commit/2f94d5fc2baa39f06b7a6393effe22d04909591d))
* **ux:** update data presentation format ([c03b0c8](https://github.com/checkip/checkip/commit/c03b0c81c3283ed7e861c891926d4a19650dffbb))



# [0.2.0](https://github.com/checkip/checkip/compare/v0.1.0...v0.2.0) (2021-01-24)


### Bug Fixes

* **ux:** properly show long strings in table cells ([b481adb](https://github.com/checkip/checkip/commit/b481adbe7e4161ef7d964baeb00fc99f1b831cf8))


### Features

* **core:** allow db path outside of app folder ([d78ab1d](https://github.com/checkip/checkip/commit/d78ab1d471535e08f275e110745bf1424b02d66b))
* **core:** initialize only with ip and hostname ([1864e89](https://github.com/checkip/checkip/commit/1864e8908764e3c208d8c0eae1711e89f29840e7))
* **core:** ip geolocation ([84c1553](https://github.com/checkip/checkip/commit/84c1553badeb99d7ebf19a03c8c9f6d499794d33))
* **core:** set hostname attribute during initialization ([0394381](https://github.com/checkip/checkip/commit/0394381526ab79521afc577b6876e3830219ef85))
* **ux:** initial web layout ([ec45eca](https://github.com/checkip/checkip/commit/ec45eca17fcc8f601a0c93caffeb75f1cf209421))



# 0.1.0 (2020-12-22)

Initial release
