using Uno;
using Uno.UX;
using Uno.Collections;
using Uno.Compiler.ExportTargetInterop;
using Fuse;
using Fuse.Triggers;
using Fuse.Controls;
using Fuse.Controls.Native;
using Fuse.Controls.Native.Android;

namespace Crashlytics {
    [ForeignInclude(Language.Java,
        "com.crashlytics.android.Crashlytics",
        "io.fabric.sdk.android.Fabric")]    
    public class Initialize : Behavior {
        public Initialize () {
            debug_log "Constructor";
            Uno.Platform2.Application.EnteringForeground += OnEnteringForeground;
            if (Uno.Platform2.Application.State == Uno.Platform2.ApplicationState.Foreground) {
                _foreground = true;
            }
        }

        void OnEnteringForeground(Uno.Platform2.ApplicationState newState)
        {
            _foreground = true;
            Init();
        }

        static bool _foreground = false;
        static bool _inited = false;
        void Init() {
            debug_log "Init";
            if (_inited)
                return;
            if (!_foreground)
                return;
            _inited = true;
            if defined(mobile) 
                InitImpl();
        }

        [Require("Cocoapods.Podfile.Target", "pod 'Fabric'")]
        [Require("Cocoapods.Podfile.Target", "pod 'Crashlytics'")]
        [Require("Source.Import", "Fabric/Fabric.h")]
        [Require("Source.Import", "Crashlytics/Crashlytics.h")]
        [Foreign(Language.ObjC)]
        extern(iOS) void InitImpl() 
        @{
            [Fabric with:@[[::Crashlytics class]]];
        @}

        [Require("Gradle.Dependency.ClassPath", "io.fabric.tools:gradle:1.+")]
        [Foreign(Language.Java)]
        extern(Android) void InitImpl()
        @{
                  Fabric.with(com.fuse.Activity.getRootActivity(), new Crashlytics(), , new CrashlyticsNdk());
        @}

    }
}
