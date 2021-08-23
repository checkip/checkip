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
