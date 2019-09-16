Facebook Login
To make it work on localhost, you need to generate a self-signed SSL certificate

Make sure you're inside the app directory (or move the files there later)

openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt
This will create localhost.key and localhost.crt files.

To run rails server using a generated self-signed SSL certificate

rails s -b 'ssl://localhost:3000?key=localhost.key&cert=localhost.crt'



I think I may need some help dude.  For my app, I decide to integrate devise with omniauth for authentication using a self-signed SSL certificate.  Maybe I got a bit ahead of myself.  My server boots up just fine using rails -s and the app is in pretty good working order at this point.  I am having a problem singing in via Facebook.  

config.omniauth :facebook, "627531920987962", "a18b2bc1f4aa08f2dbefedd6ea2166bb", callback_url: ""     

- I tried a number of things in the callback_url string but nothing is really matching up.  
- When I go to login with Facebook I get this error....

Can't Load URL: The domain of this URL isn't included in the app's domains. To be able to load this URL, add all domains and subdomains of your app to the App Domains field in your app settings.