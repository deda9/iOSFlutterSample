# iOSFlutterSample

How to integrate iOS project with flutter project with sending message from Flutter to Native and vice versa

### Install
1- Install Flutter SDK [through](https://flutter.io/docs/get-started/install/macos) or download [through](https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.0.0-stable.zip)

2- Open your flutter directory 
`cd path/to/your/flutter/sdk`


3- Export the path for the flutter SDK by typing this in your terminal 
`export PATH=$PATH:`pwd`/flutter/bin`

4- Check all is working file by typing this in your terminal
`flutter doctor`


### Install with your existing iOS Project
1- Open your project directory
`cd some/path/`

2- Create your flutter project
`flutter create -t module my_flutter`

3- In your exiting project open the podfile and set the path for the flutter sdk
   Note: Change the `flutter_application_path`to match yours
`  flutter_application_path = '/Users/bassemqoulta/Desktop/FlutterChannel/my_flutter'
  eval(File.read(File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')), binding)
`

4- Run `pod install`

5- Add Run Script in your existing iOS Project
```"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" build
"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" embed
```


### Open your flutter project with your existing iOS Project
1- `import Flutter`

2- Create your FlutterViewController 

3- then present your view controller like normal
`self.present(flutterViewController, animated: false, completion: nil)`


### Run iOS Project
1- open the path to .iOS file
2- Run `flutter run` or you can run it with [IntelliJ Pulign] (https://github.com/flutter/flutter-intellij)  or run directly with Xcode.


