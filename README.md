# Fuse-Crashlytics
[![license](https://img.shields.io/github/license/bolav/fuse-crashlytics.svg?maxAge=2592000)](https://github.com/bolav/fuse-crashlytics/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/bolav/fuse-crashlytics.svg?branch=master)](https://travis-ci.org/bolav/fuse-crashlytics)

[Crashlytics](http://try.crashlytics.com/) API bindings for [Fusetools](http://www.fusetools.com).

This only works on Fuse 0.35 and higher.

## Compiling

This project requires `-DCOCOAPODS` for iOS or `-DGRADLE` for Android.

## Running the Example project

You can find the example in the `CrashlyticsExample` folder. It contains:

- CrashlyticsExample.unoproj - Our project file
- MainView.ux - The Super basic markup for our app (NO UI)

### Editing the Crashlytics parts

Log in to [Crashlytics](https://fabric.io/kits/ios/crashlytics/install), and get your API key, and shellkey. Add these to your project with this block to your `.unoproj`:

    "Crashlytics": {
      "APIKey": "api_key",
      "ScriptKey": "script_key_second_key_from_script"
    },

The keys you get from this line:

    "${PODS_ROOT}/Fabric/run" api_key script_key


### Run

You should now be able to run, and get the result in your dashboard.
