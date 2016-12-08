# Fuse-Crashlytics
[![license](https://img.shields.io/github/license/bolav/fuse-crashlytics.svg?maxAge=2592000)](https://github.com/bolav/fuse-flurry/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/bolav/fuse-flurry.svg?branch=master)](https://travis-ci.org/bolav/fuse-flurry)

[Crashlytics](http://try.crashlytics.com/) API bindings for [Fusetools](http://www.fusetools.com).

*NOTE THIS ONLY WORKS FOR iOS!*

The reason for this is no NDK support for Crashlytics. Read this thread: https://twittercommunity.com/t/gradle-experiental-support/53441/16

## Compiling

This project requires `-DCOCOAPODS`.

## Running the Example project

You can find the example in the `CrashlyticsExample` folder. It contains:

CrashlyticsExample.unoproj - Our project file
MainView.ux - The Super basic markup for our app (NO UI)

### Editing the Crashlytics parts

Log in to [Crashlytics](https://fabric.io/kits/ios/crashlytics/install), and get your API key, and shellkey. Add these to your project with this block to your `.unoproj`:

    "Crashlytics": {
      "APIKey": "api_key",
      "ScriptKey": "script_key_second_key_from_script"
    },



### Run

You should now be able to run, and get the result in your dashboard.
