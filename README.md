<br />
<div align="center">
  <a href="https://github.com/pnkr01/ghumo/">
    <img src="images/pic_front.jpg" alt="Logo" width="80" height="80">
  </a>
  <h1 align="center"><b>GHUMO</b></h1>   `

  <p align="center">
    Travel with Passion and Explore Uttrakhand.
  </p>
<img src="https://img.shields.io/github/languages/code-size/pnkr01/ghumo?style=flat-square" alt="Code size" />
<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/pnkr01/ghumo?style=flat-square">
<img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/pnkr01/ghumo?style=flat-square">
<img alt="GitHub Repo forks" src="https://img.shields.io/github/forks/pnkr01/ghumo?style=flat-square">
<img alt="GitHub Repo issues" src="https://img.shields.io/github/issues/pnkr01/ghumo?style=flat-square">
  
<br />

·
<a href="https://github.com/pnkr01/ghumo/issues">Report Bug</a>
·
<a href="https://github.com/pnkr01/ghumo/issues">Request Feature</a>
</div>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#why-ghumo-">Why GHUMO</a>
    </li>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#key-features-implemented">Key Features Implemented</a>
    </li>
    <li>
      <a href="#tech-stacks">Tech Stacks</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li><a href="#app-screenshots">App ScreenShots</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## Why GHUMO ?

We examine that in exploring char dham, and notable place near them, there are many issue faced by travellers and we want to solve this problem using Tech. 

India has seen a significant increase in the number of Toursim since the past year. Yet People still face trouble and could not get good service. So we're here.

## About The Project

<div align="center">
<img alt="GHUMO-HACKStack Animation" src="https://user-images.githubusercontent.com/83778936/177198234-5e4f0268-3150-4833-a84b-ee4bbe8c1942.gif">
</div>


Suppose you are a Traveller and want to explore Uttarakhand with all facility included such as food area, notable place near you, Good restaurent to stay and restaurent to eat. This is where GHUMO comes in.


## Key Features Implemented

- Awesome UX and easy to use friendly interface

- Manage you travelling vibes.

- Find the nearest restaurent, hotels and notable place.

- Inbuilt Wallet.

- Know about Places near you.

- Change dham with one click.

### Tech Stacks

**Mobile Applicaton:**

- Flutter
- Firebase
- Firestore Database
- Google Cloud Platform
- Places API


## Getting Started

You can test GHUMO in your own development environment. This section shows you how:

## Prerequisites

You'll need to set up the IDE and mobile device emulator, or any mobile testing device on your local system.


**Flutter Environment: You'll need to have the following installed:**

1. [Flutter SDK](https://flutter.dev/docs/get-started/install)
2. [Android Studio](https://developer.android.com/studio)

***Ensure you are testing the app using Flutter version [2.10.5](https://docs.flutter.dev/development/tools/sdk/releases?tab=windows) and above.***

*For checking flutter version:*

- Run flutter --version in terminal

If your version is not upto date, follow these steps to upgrade:

- flutter channel stable to switch to the channel having stable version of flutter updates
- flutter upgrade to get the latest flutter version

### *Development Environment: For setting up the development environment, follow the steps given below.*

- Clone this repository after forking using git clone <https://github.com/pnkr01/ghumo.git>
- cd into `GHUMO`
- Check for flutter setup and connected devices using `flutter doctor`
- Get all the dependencies using `flutter pub get`

- **Run the app using `flutter run`**

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Structure

This project follows MVVM architecture with following structure:

```text
GHUMO/lib/
├── auth/                       
     ├── components/   
           └── nearby_ev_station_results.dart 
                 └──new
                 ├  └── screen to register new user.
                 └──old
                 ├    └──screen to register old user.
                 └──profile
                     └──screen to save deatils.
  ├── service/   
           └── auth_serice.dart
           └── login_signin.dart
           └── otp_screen.dart

  ├── global/   
           └── change_dham.dart.dart
           └── errordialog.dart
           └── progreesbar.dart
           └── loading_dialog.dart
  ├── home/   
           └── drawer
                ├── components/
                      ├── help_support.dart
                      ├──my_account.dart
                      ├──settings.dart
                      ├──wallet.dart
                ├── drawer.dart
                └── user.dart

           └── hotels
                ├── carousel_hotels.dart
                └── near_hotel.dart
           └── pagination
                └── pagination.dart.dart
           └── places
                ├── carousel_places.dart
                ├── details_page.dart
                ├── near_place.dart
                └── db.dart
           └── restaurent
                ├── carousel_restaurent.dart
                └── near_prestaurent.dart.dart
           └── wallet
                ├── wallet_activate.dart
                └── wallet_main.dart.

  ├── splash/ 
           └── splash.dart                       
  
└── main.dart                  # Heart of this App.
```

## APP Screenshots

<div align="center">

![7](https://user-images.githubusercontent.com/83778936/177197773-7c236858-8924-4c70-a78b-bb578c815f68.jpg)
![4](https://user-images.githubusercontent.com/83778936/177197767-87d31a7f-4540-433d-bee2-443f1e3f61ad.jpg)
![5](https://user-images.githubusercontent.com/83778936/177197770-80d1e83d-bdef-457c-ae89-eb2ab709ef4f.jpg)
![1](https://user-images.githubusercontent.com/83778936/177197755-3d8e6c24-53a3-4d7d-8b05-e220df0b88fc.jpg)
![2](https://user-images.githubusercontent.com/83778936/177197763-5d297adc-04fb-4dbf-a990-5532302ddf58.jpg)
![3](https://user-images.githubusercontent.com/83778936/177197764-803ba6ee-feb1-4aa6-8f2f-1850d9743bf2.jpg)
![6](https://user-images.githubusercontent.com/83778936/177197771-d43034bb-e981-4793-8ed0-684c0b32cf5e.jpg)
![photo_2022-07-04_23-02-34](https://user-images.githubusercontent.com/83778936/177198912-5542e2e5-eef1-4b66-9b04-03b79c47fda7.jpg)


</div>

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Team Name - Apollo 
<br>
[Krishna Mahato](https://github.com/krishna9304)
<br>
[Saheb Giri](https://github.com/iamsahebgiri)
<br>
[SwetaPadma Das](https://github.com/swetapadma15)
<br>
[Pawan Kumar](https://github.com/pnkr01)

Project Link: [https://github.com/pnkr01/ghumo/](https://github.com/pnkr01/ghumo/)

Made with ♥ by Team Apollo in Hackwar 3.0 organised by Codex Club(Only Coding Club of ITER).



