//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

<<<<<<< HEAD
=======
import audio_session
>>>>>>> f0b4fa245cdd1de6ed335fdfc3a679c7fd5ec77d
import audioplayers_darwin
import cloud_firestore
import firebase_auth
import firebase_core
import firebase_database
import firebase_storage
<<<<<<< HEAD
import path_provider_foundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
=======
import just_audio
import path_provider_foundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AudioSessionPlugin.register(with: registry.registrar(forPlugin: "AudioSessionPlugin"))
>>>>>>> f0b4fa245cdd1de6ed335fdfc3a679c7fd5ec77d
  AudioplayersDarwinPlugin.register(with: registry.registrar(forPlugin: "AudioplayersDarwinPlugin"))
  FLTFirebaseFirestorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseFirestorePlugin"))
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  FLTFirebaseDatabasePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseDatabasePlugin"))
  FLTFirebaseStoragePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseStoragePlugin"))
<<<<<<< HEAD
=======
  JustAudioPlugin.register(with: registry.registrar(forPlugin: "JustAudioPlugin"))
>>>>>>> f0b4fa245cdd1de6ed335fdfc3a679c7fd5ec77d
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
}
