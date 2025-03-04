# olatools

## DU Cybersecurity 
Head Down, Spirits Up, Let's Find a Way In

## To Start, Mood
| Mood                         | Music (Spotify Link)                                                        | The Weather |
|------------------------------|-----------------------------------------------------------------------------|---|
| Positive                     | [Spotify Link](https://open.spotify.com/track/1mCsF9Tw4AkIZOjvZbZZdT?si=82153e62cedd4c97) | Break My Stride |
| Intense                      | [Spotify Link](https://open.spotify.com/track/409z4jUHpq7eIkg3N3FzZh?si=e2fae5de740d409d) | Windowlicker |
| Inquisitive                  | [Spotify Link](https://open.spotify.com/track/2dTrqoMmFNPBXkM9YeE8Ug?si=cd6bc749ecb04aa9) | Sunrise Projector |
| Collected                    | [Spotify Link](https://open.spotify.com/track/45956r7fKLUhPjFUstiBj5?si=d5a412af1802453c) | You're So Cool |
| Upset                        | [Spotify Link](https://open.spotify.com/track/68KTyr6YicT512yiOvNSM1?si=15cae048612046ee) | Ends |
| Unheard                      | [Spotify Link](https://open.spotify.com/track/5wvxRlpUTSX9CE52yFZsIY?si=59f8e55d58654d8b) | Cell Therapy |
| Learned and Ready to Drop    | [Spotify Link](https://open.spotify.com/track/5Nn2Dj7OQsGL6pgQ9iIzPp?si=71bc4c2cb54c4736) | Ghostwriter |
| Ready to Rock                | [Spotify Link](https://open.spotify.com/track/43sRETEzELOs53uyy4BGQ8?si=08684555d0c54949) | Saturday Night |
| Emerging                     | [Spotify Link](https://open.spotify.com/track/2Ud3deeqLAG988pfW0Kwcl?si=6d82d6182af64673) | All My Friends |
| Finally OK                   | [Spotify Link](https://open.spotify.com/track/3XT7cOVsRYUeD6r75QsO6r?si=21f8c70b97f5498a) | What's The Altitude |


## Terminals
MacOS: Iterm2 is the de-facto standard. It can be downloaded here:  
[iTerm2: If you don't know, now you know](https://iterm2.com)  

![quatro](https://github.com/user-attachments/assets/e4846692-5529-4ad4-986e-aaf4b22c2946)

Windows: Tabby.sh is super slick and allows for loads of customisation:  
[Tabby: A terminal for the modern age](https://tabby.sh)  

<img width="1024" alt="405485425-b7e438ae-106b-43ba-825c-3aaa6164a186 23 55 08" src="https://github.com/user-attachments/assets/d9ee6420-b19e-45b1-ae8f-75ccdb35f02b" />

Linux: You already know your built-ins. See above.

## SSH'ing into your box
I navigate to the following:  
First, log in at:  
<a href="https://bootcampspot.instructure.com" target="_new">bootcampspot.instructure.com</a>

Jam to Courses in the far-left column

Jammy then to Modules in the column that appears to the right of the original far-left column

Scroll down to find "Web Lab". Click on it.

Another screen appears, asking if you really want to do what you inititally wanted to do. Love getting second-guessed by computers? A bit of a pain but click on the box that says: "Load Web Lab in a new window"

The web complains, saying it has to go to work now and that your on-demand lab will be ready in X:XX amount of minutes. It's a bit slow to stand up, like you just asked momma to come off her lunch shift to give you a computer. She's had a hard morning, and here you are.

![loading](https://github.com/user-attachments/assets/52748ed2-6695-497c-aebe-fd17b89da1ca)

Yup, we're still waiting. 1:07 minutes left. Tortillas are not ready. Your little sister.. wait! Here we are:

![shaking](https://github.com/user-attachments/assets/a6c495a9-1ade-4ec2-ae25-4d1be7c65487)

You get an emulated screen of a computer's desktop. In the bar on the bottom are 6 icons. The second from the left is an icon to load the command prompt. <b>Click on it</b>.

A fake screen within a fake screen appears, and you should see a command prompt. Blinking block cursor awaiting your command. A new feeling of power. Enter this command:  
`curl -4 ifconfig.me; echo`

![command-entered](https://github.com/user-attachments/assets/19801180-e264-4ba8-bb71-e00cb441c869)

You'll get an IP address that appears by your next prompt, in the format of xxx.xxx.xxx.xxx. Write this IP address down, or select and copy it to your clipboard.

You're done with the fake fake emulators. Load up your iterm2 or tabby terminal. Let me know if I need to add more instruction to this part. But, once there, type the following:  
`ssh sysadmin@(the ip address that you wrote down or copied to clipboard)`  

Using the deets from the above screenshot/example, you would enter:  
`ssh sysadmin@13.239.38.155`

Password is the same we've always used.

From there, you'll hopefully see something like the following:  
```
Attempting to SSH into 3.107.214.197 with username 'sysadmin'...
Warning: Permanently added '3.107.214.197' (ED25519) to the list of known hosts.
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1067-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Wed Jan 22 05:57:13 UTC 2025

 * Ubuntu Pro delivers the most comprehensive open source security and
   compliance features.

   https://ubuntu.com/aws/pro

Expanded Security Maintenance for Applications is not enabled.

141 updates can be applied immediately.
79 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

40 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

sysadmin@ip-10-0-1-237:~$
```

From here, going forward, you're connected to the remote box using a terminal that's running natively on your computer. You don't have to fuss with a particular right-click in Chrome, becaause the emulator is no longer running in a web browser. Your system is talking to the DU system directly. You just leveled up.

Next.

[Frontier Psychiatrist](https://open.spotify.com/track/3mPJHVpCvzykoxmWnYdnFq?si=789d4f381cd645a7)

