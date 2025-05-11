plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android") version "2.1.0"
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // ✅ Add Google services plugin here!
}

android {
    namespace = "com.example.mybackend"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.mybackend"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    // Firebase configuration
    buildFeatures {
        viewBinding = true
    }
}

dependencies {
    // Firebase Firestore
    implementation("com.google.firebase:firebase-firestore:24.2.2")
    // Firebase Authentication (optional)
    implementation("com.google.firebase:firebase-auth:21.1.0")
    // Firebase Analytics (optional)
    implementation("com.google.firebase:firebase-analytics:21.1.0")

    // Other dependencies...
}

flutter {
    source = "../.."
}
