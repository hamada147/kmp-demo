Pod::Spec.new do |spec|
    spec.name                     = 'local_cocoapods_dependency'
    spec.version                  = '1.0.0-alpha'
    spec.homepage                 = ''
    spec.source                   = { :http=> ''}
    spec.authors                  = 'Ahmed Moussa'
    spec.license                  = ''
    spec.summary                  = 'Demo KMM project for using local cocoapods dependency'
    spec.vendored_frameworks      = 'build/cocoapods/framework/LocalCocoapodsDependencyDemo.framework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target = '13.0'
    spec.osx.deployment_target = '12.0'
    spec.tvos.deployment_target = '13.0'
    spec.watchos.deployment_target = '8.0'
    spec.dependency 'demo', '1.0.0'
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':',
        'PRODUCT_MODULE_NAME' => 'LocalCocoapodsDependencyDemo',
    }
                
    spec.script_phases = [
        {
            :name => 'Build local_cocoapods_dependency',
            :execution_position => :before_compile,
            :shell_path => '/bin/sh',
            :script => <<-SCRIPT
                if [ "YES" = "$OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED" ]; then
                  echo "Skipping Gradle build task invocation due to OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED environment variable set to \"YES\""
                  exit 0
                fi
                set -ev
                REPO_ROOT="$PODS_TARGET_SRCROOT"
                "$REPO_ROOT/../../../../../private/var/folders/sd/vq_ngt5j7kqfzb0t3z91t5g40000gn/T/wrap135loc/gradlew" -p "$REPO_ROOT" $KOTLIN_PROJECT_PATH:syncFramework \
                    -Pkotlin.native.cocoapods.platform=$PLATFORM_NAME \
                    -Pkotlin.native.cocoapods.archs="$ARCHS" \
                    -Pkotlin.native.cocoapods.configuration="$CONFIGURATION"
            SCRIPT
        }
    ]
                
end