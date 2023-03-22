import org.gradle.internal.os.OperatingSystem

val os: OperatingSystem = OperatingSystem.current()
group = "tech.compubotics.demo"
version = "1.0.0-alpha"

plugins {
    kotlin("multiplatform") version "1.8.0"
    kotlin("native.cocoapods") version "1.8.0"
}

buildscript {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
    }
    dependencies {
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.8.0")
    }
}

repositories {
    mavenCentral()
}

kotlin {
    jvm {
        compilations.all {
            kotlinOptions.jvmTarget = "1.8"
        }
        withJava()
        testRuns["test"].executionTask.configure {
            useJUnitPlatform()
        }
    }
    if (os.isMacOsX) {
        ios()
        cocoapods {
            this.summary = "Demo KMM project for using local cocoapods dependency"
            this.version = rootProject.version.toString()
            this.authors = "Ahmed Moussa"
            this.ios.deploymentTarget = "13.0"
            this.osx.deploymentTarget = "12.0"
            this.tvos.deploymentTarget = "13.0"
            this.watchos.deploymentTarget = "8.0"
            framework {
                this.baseName = "LocalCocoapodsDependencyDemo"
            }
            // The following is the way we import local cocoapods dependency
            pod("demo") { // Pod Name
                version = "1.0.0" // Pod Version
                // packageName = "demo1" // Package Name // Change it only if needed
                source = path(project.file("iOSLibs/demo")) // local cocoapods spec file path
            }
        }
    }

    sourceSets {
        val commonMain by getting
        val commonTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
        val jvmMain by getting
        val jvmTest by getting
        if (os.isMacOsX) {
            val iosMain by getting
            val iosTest by getting
        }
    }
}
