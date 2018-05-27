# MovieAppFlutter

Steps for getting started with Flutter on Visual Studio Code - 

1.  Download the Flutter SDK file from here (for our purposes, you don't need anything else from the Flutter site):
    https://flutter.io/get-started/install/

2.  Download Android Studio if you wish to deploy to Android, we won't use the IDE but the Android SDK files are needed:
    https://developer.android.com/studio/

    Download Xcode if you wish to deploy to iOS (you will need a Mac for this of course)

3.  Follow these instructions to set up Flutter on Visual Studio Code:
    
    i.  Install VS Code version 1.20.1 or later.

    ii. Install the Flutter plugin
    
        a. Start VS Code
        
        b. Invoke View>Command Palette…
        
        c. Type ‘install’, and select the ‘Extensions: Install Extension’ action
        
        d. Enter flutter in the search field, select ‘Flutter’ in the list, and click Install
        
        e. Select ‘OK’ to reload VS Code (Restart needed)
    
    iii. Create new app

        a. In VS Code, invoke View>Command Palette…
        
        b. Type ‘flutter’, and select the ‘Flutter: New Project’ action
        
        c. Enter a project name (e.g. myapp), and press Enter
        
        d. Specify a location to place the project, and press the blue OK button
        
        The above command creates a Flutter project directory called myapp that contains a simple demo app that uses Material Components.  In the project directory, the code for your app is in lib/main.dart.

    iv.  Run the app

        a. Make sure a target device is selected in the lower, right-hand corner of VS Code
        
        b. Press the F5 button on the keyboard, or invoke Debug>Start Debugging
        
        c. Wait for the app to launch
        
        d. If everything works, after the app has been built, you should see your starter app on your device or simulator
        
    {Source: https://flutter.io/get-started/editor/#vscode}
    
    <b>Nb: If you get the message 'Flutter SDK not located' in VS Code, select 'Locate SDK' and navigate to the Flutter SDK folder you saved earlier</b>

After creating your starter app, you can replace the contents of your Flutter project directory with the code found in the movie_app subfolder in this repository (or copy it to a new one, and open that folder afresh in VS Code)

<b>Don't forget to replace the AWS API Gateway link in the variable _apiGatewayURL in main.dart with your own. The gateway URL mentioned in code currently has been retired. </b>

Enjoy coding with Flutter! - The Assembly team
