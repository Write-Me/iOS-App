fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios updateCertificates
```
fastlane ios updateCertificates
```
Обновление сертификатов и провиженов в репозитории
### ios beta
```
fastlane ios beta
```
Push a new beta build to TestFlight
### ios appstore
```
fastlane ios appstore
```
Push a new beta build to AppStore
### ios adHoc
```
fastlane ios adHoc
```
Загрузка в AdHoc
### ios test
```
fastlane ios test
```
Загрузка в AdHoc

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
