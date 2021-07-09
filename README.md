# <strong>Flutter-Firebase Authentication</strong>

- Built a Flutter App with basic UI that uses Firebase Auth to authenticate the user to perform the sign-in/sign-up process accordingly.
- In this project, I have made provisions for users to <strong>sign-in anonymously, sign-up with email-id and password as well as sign-in with email-id and password.</strong>

## <strong> My approach: </strong> 

## UI :
- The UI for this project is pretty basic and monotonous.
- I have made use of the Material UI offered by Flutter.
- There is a toggle button on the authentication page where the user can smoothly transition between the sign-in and sign-up page.

| Sign-up | Sign-in | Home |
|---------|---------|------|
| ![Image](https://i.imgur.com/R4UWmtV.png) | ![Image](https://i.imgur.com/rGeHeHv.png) | ![Image](https://i.imgur.com/PlUi5CJ.png) |


## AUTHENTICATION PROCESS:
- This app makes use of <strong>Flutters Streams</strong> to check the state of the User. 
- Based on whether the User has an account and is logged-in or whether a user does not have an account and isn't logged in, we show the home page and the authentication page respectively.
- The authentication process is mainly carried out by <strong> Firebase Auth </strong>, in my case I am using :

    ``` 
    firebase_auth: ^0.14.0+5
    ```

- I have also enabled validation to check if a valid email id has been entered and also to check if the password has sufficient character.
- It also displays error message to let user know in case the credentials are incorrect or if the account already exists.


<strong> This is a basic project where I am just trying to figure out how Firebase integration works with Flutter. </strong>

## <strong> Author:</strong> 
[Rohini Rao](https://github.com/RohiniRG)

