# SpotifyGeoFreedom

**Bypassing Regional Restrictions for a Free Spotify Account**

This solution is designed for users residing in countries where Spotify is not officially available and they are forced to register through other countries and also confirm their fake location every 14 days using a VPN.

## Method Overview

This method employs GitHub Actions to run a runner with a USA location one day a week. It logs into the desktop Spotify client using your username and password, allowing you to access Spotify as if you were in the USA.

### Requirements

Before getting started, make sure you have the following:

- A GitHub account
- A free Spotify account
- Your Spotify account must have the USA selected as the country ( if you have another country specified, then you can change it yourself to Usa, use Vpn )
  
> [!IMPORTANT]  
> After successfully setting up the runner and initial authorization in the client, you do not need to use a VPN or other similar tools for the Spotify client, this may trigger their algorithms to reset your current password, and you will have to change it again in the fork settings and go through initial authorization, just use Spotify on your regular home network

### Getting Started

> [!NOTE]
> The country of your Spotify account should already be changed to the USA

<details>
<summary><small>Text tutorial</small></summary><p>

Follow these steps to set up and use this method:

1. **Fork this [Repository](https://github.com/Tuc-tac/SpotifyGeoFreedom)**
2. **Repository Settings**
   - In your fork's `Settings`
   - navigate to `Secrets and Variables` => `Actions`

4. **Create Repository Secrets**: 
    - Click on `New Repository Secret`
    - In the `Name` field, enter `LOGIN`
    - In the `Secret` field, enter your Spotify account login. Click `Add Secret`

5. **Password Secret**:
    - Repeat the same process for your password
    - Click `New Repository Secret`
    - Enter `PASS` in the `Name` field
    - Enter your Spotify account password in the `Secret` field. (Remember to update it here if you change your password)

6. **Activate the Runner**:
    - Go to the `Actions` tab in your forked repository
    - Confirm the activation of runners for your fork
    - In the upper left part of the screen, find two actions with the names:
      - Run SpotifyGeoFreedom Scrip
      - Keepalive Workflow
    - You need to activate these two runners. To do this, click on each of them in turn and select "enable workflow" on the right side of the screen
</details>

<details>
<summary><small>Video tutorial</small></summary><p>

[![YouTube](https://img.shields.io/badge/YouTube-red?style=for-the-badge&logo=youtube)](https://youtu.be/GriSDB4gIbU)

</details>

## FAQ

### How can I check the runner's operation after the initial setup?
> [!WARNING]
It is not recommended to frequently use manual runner launches as Spotify may reset your current password due to "suspicious activity"

If the time trigger has not yet activated, and you want to check if your runner is working successfully, manual launch is provided. Follow these steps:

<details> 
  <summary><small>Steps</small></summary><p> 
     
- While on the main page of your fork, go to the tab ![2023-09-11 080820](https://github.com/Tuc-tac/SpotifyGeoFreedom/assets/143889047/f26ca153-978e-4aed-8290-6267987635da)
- In the left sidebar, click the "Run SpotifyGeoFreedom Script" button 
  <details> 
  <summary><small>screenshot</small></summary><p> 

  ![Снимок экрана 2023-09-11 081017](https://github.com/Tuc-tac/SpotifyGeoFreedom/assets/143889047/d83e565c-bc62-4244-8506-cc611f5aad47)

  </details>
- On the right side, a dropdown menu "Run workflow" will appear, inside of which there will be a green "Run workflow" button. Click on it to start the runner
  <details> 
  <summary><small>screenshot</small></summary><p> 

  ![Снимок экрана 2023-09-11 085001](https://github.com/Tuc-tac/SpotifyGeoFreedom/assets/143889047/940f4558-b7c3-486a-8141-de5635742411)

  </details>
- Wait for a couple of minutes until the script completes, and its icon turns green
  <details> 
  <summary><small>screenshot</small></summary><p> 

  ![Снимок экрана 2023-09-11 082025](https://github.com/Tuc-tac/SpotifyGeoFreedom/assets/143889047/22aa5bf0-6b46-4a4a-a003-bbd857f46130)

  </details>
- Go to the runner actions "Run SpotifyGeoFreedom Script" => "run-powershell"
- Expand the "Сlient download and login" action
- If the script outputs "Client response: Successful authentication," then everything is fine; your runner has successfully opened the Spotify client using your login and password
  <details> 
  <summary><small>screenshot</small></summary><p> 

  ![Снимок экрана 2023-09-11 082132](https://github.com/Tuc-tac/SpotifyGeoFreedom/assets/143889047/e99f089e-fe42-4d04-98d0-1a712cf7354b)

  </details>
- If you see the message "Client response: Failed authenticating: login5_invalid_credentials," then most likely you did not correctly set your login and password in the secret variables. Try doing it again. If you are sure that your login and password were set correctly, then in 99% of cases, Spotify has reset your password. Check your email; there should be a password reset form. You need to reset it and set the new password in the secret variable
</details>

### At what time does the runner trigger?
The launch occurs every Thursday at 2:37 UTC

### Why is a login and password necessary? Is it considered secure?
Login and password are required to access your account from an Usa IP address, thus resetting the 14-day regional restriction counter. While setting up the method, you input your login and password into actions secrets, they are stored there in encrypted form, and only you have access to them. This is absolutely secure

### Why can't I log into my Spotify account? 
It's relatively rare, but Spotify can detect false suspicious activities. If this happens, you will receive an email with instructions to reset your password. After creating a new password, don't forget to update the PASS secret in your fork's settings.

### Does it really work?
As of now (15.07.2024), this method has been working for me for about a year. In the very beginning, Spotify's algorithms reset my password a few times. After that, these resets stopped, and I have been using my main account without any problems for over 8-9 months.

I created a [thread](https://github.com/Tuc-tac/SpotifyGeoFreedom/issues/5) for the general flow of your thoughts

## Disclaimer
You are using this method at your own risk; the developer is not responsible for any potential issues.
