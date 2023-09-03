# SpotifyGeoFreedom

**Bypassing Regional Restrictions for a Free Spotify Account**

This solution is designed for users residing in countries where Spotify is not officially available and they are forced to register through other countries and also confirm their fake location every 14 days using a VPN.

## Method Overview

This method employs GitHub Actions to run a runner with a USA location three times a week. It logs into the desktop Spotify client using your username and password, allowing you to access Spotify as if you were in the USA.

### Requirements

Before getting started, make sure you have the following:

- A GitHub account
- A free Spotify account
- Your Spotify account must have the USA selected as the country ( if you have another country specified, then you can change it yourself to Usa, use Vpn )

### Does it really work?
I have no idea🤣 as long as it's just being tested 

### Getting Started

<details>
<summary><small>Text tutorial</small></summary><p>

Follow these steps to set up and use this method:

1. **Fork this [Repository](https://github.com/amd64fox/SpotifyGeoFreedom)**
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
    - Confirm the activation of the runner
</details>

<details>
<summary><small>Video tutorial</small></summary><p>

[![YouTube](https://img.shields.io/badge/YouTube-red?style=for-the-badge&logo=youtube)](https://youtu.be/-d-GTcHpodo)

</details>

## Disclaimer
You are using this method at your own risk; the developer is not responsible for any potential issues.
