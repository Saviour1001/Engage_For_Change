# App Name

## Description

Hey there !! This app was made in order to chanelize the energy of youth to fill the
void of the society. We aimed to build a platform where people could connect and post
about social work and help in uplift the community. This idea was inspired during the
harsh times of Covid 19 pandemic. Its our responsibility to grow the society from where
it is now to a better future.

## How to install on Android device

You could find the apk in the repository. Simply download the apk and install it. The app will
be up and running. We are always working on adding new feature for improving the performance and
add new features. We will update the apk in the main branch of the repository.
So give this repository a star so that you get notified of any updates :)

## How to run the source code on your computer

- Install flutter on your machine

  You could refer to this [video](https://youtu.be/ZJl6PsBbnbg) to install flutter on your device.

- Create a new flutter project on your machine by writing the following command in terminal

  `flutter create my_awesome_flutter_project`

- Delete the lib folder and pubspec.yaml file from your project

- Clone this repository and copy the below listed files to your local flutter project

  1. lib
  2. assets
  3. pubspec.yaml

- Get the flutter packages you will be needing by running the following command in terminal

  `flutter packages get`

- Make sure the imports of all the dart files in the lib folder are correct. If you are getting a lot of red line errors, its probably cause of outdated dependacies or incorrect addresses in the import files. The addresses can be altered depending upon where are you placing your project. If the dependancies are outdated refer to Flutter forums, considering the rate at which Flutter upgrades are getting delivered it is possible the methods which are working now might get deprecated soon. But don't worry StackOverflow is always there to save the day xD

- Setup Firebase
  The app uses Firebase as backend so you will be needing to create a Firebase project of yours and set it up to get the authentication and database services up and running.
  Its very easy, just create a new Firebase project and get a google-services.json key from there and place it in the folder project_name/android/app.
  You could refer this [video](https://youtu.be/83YsBPPwISs) to setup Firebase.

- Congratulations if you made it till here. Now just connect your emulator or your device to the computer and write the following command in terminal.

  `flutter run`
