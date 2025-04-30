![image](https://github.com/user-attachments/assets/717e8f39-746d-4485-835a-44e89a2085bc)

<div id="user-content-toc">
  <ul align="left" style="list-style: none;">
    <summary>
      <h1>Rekall Corporation<br><br></h1>
      <h2>Penetration Test Report</h2>
    </summary>
  </ul>
</div>

# Confidentiality Statement
 
This document contains confidential and privileged information from Rekall Inc. (henceforth known 
as Rekall). The information contained in this document is confidential and may constitute inside or 
non-public information under international, federal, or state laws. Unauthorized forwarding, printing, 
copying, distribution, or use of such information is strictly prohibited and may be unlawful. If you are 
not the intended recipient, be aware that any disclosure, copying, or distribution of this document or 
its parts is prohibited.

# Table of Contents
 
- Confidentiality Statement  2 
- Contact Information  4 
- Document History  4 
- Introduction  5 
- Assessment Objective  5 
- Penetration Testing Methodology  6 
- Reconnaissance  6 
- Identification of Vulnerabilities and Services  6 
- Vulnerability Exploitation  6 
- Reporting  6 
- Scope  7 
- Executive Summary of Findings  8 
- Grading Methodology  8 
- Summary of Strengths  9 
- Summary of Weaknesses  9 
- Executive Summary Narrative  10 
- Summary Vulnerability Overview  13 
- Vulnerability Findings  14 

## Contact Information

| **Field**         | **Details**        |
| :--- | :--- |
| **Company Name** | Nothing LLC |
| **Contact Name** | Broen Westberg |
| **Contact Title** | Ghost |

## Document History

| **Version** | **Date** | **Author(s)** | **Comments** |
| :--- | :--- | :--- | :--- |
| 63v7.4f | 2025-04-28 | Broen Westberg | Reported in Markdown (.md) | 
 
 
 
 
 
 
  


# Introduction
 
In accordance with Rekall policies, our organization conducts external and internal penetration tests 
of its networks and systems throughout the year. The purpose of this engagement was to assess the 
networks' and systems' security and identify potential security flaws by utilizing industry-accepted 
testing methodology and best practices. 
 
For the testing, we focused on the following: 
 
- Attempting to determine what system-level vulnerabilities could be discovered and exploited 
with no prior knowledge of the environment or notification to administrators. 
- Attempting to exploit vulnerabilities found and access confidential information that may be 
stored on systems. 
- Documenting and reporting on all findings. 
 
All tests took into consideration the actual business processes implemented by the systems and 
their potential threats; therefore, the results of this assessment reflect a realistic picture of the actual 
exposure levels to online hackers. This document contains the results of that assessment. 
 
# Assessment Objective
 
The primary goal of this assessment was to provide an analysis of security flaws present in Rekall's 
web applications, networks, and systems. This assessment was conducted to identify exploitable 
vulnerabilities and provide actionable recommendations on how to remediate the vulnerabilities to 
provide a greater level of security for the environment. 
 
We used our proven vulnerability testing methodology to assess all relevant web applications, 
networks, and systems in scope.  
 
Rekall has outlined the following objectives: 
 
**Table 1: Defined Objectives**

| **Objective** |
|---------------|
| Find and exfiltrate any sensitive information within the domain. |
| Escalate privileges. |
| Compromise several machines. | 
 
# Penetration Testing Methodology
 
Reconnaissance 
  
We begin assessments by checking for any passive (open source) data that may assist the 
assessors with their tasks. If internal, the assessment team will perform active recon using tools 
such as Nmap and Bloodhound. 
 
Identification of Vulnerabilities and Services 
 
We use custom, private, and public tools such as Metasploit, hashcat, and Nmap to gain perspective 
of the network security from a hacker's point of view. These methods provide Rekall with an 
understanding of the risks that threaten its information, and also the strengths and weaknesses of 
the current controls protecting those systems. The results were achieved by mapping the network 
architecture, identifying hosts and services, enumerating network and system-level vulnerabilities, 
attempting to discover unexpected hosts within the environment, and eliminating false positives that 
might have arisen from scanning.  
 
Vulnerability Exploitation 
 
Our normal process is to both manually test each identified vulnerability and use automated tools to 
exploit these issues. Exploitation of a vulnerability is defined as any action we perform that gives us 
unauthorized access to the system or the sensitive data.  
 
Reporting 
 
Once exploitation is completed and the assessors have completed their objectives, or have done 
everything possible within the allotted time, the assessment team writes the report, which is the final 
deliverable to the customer. 
 
 
 
  


# Scope
 
Prior to any assessment activities, Rekall and the assessment team will identify targeted systems 
with a defined range or list of network IP addresses. The assessment team will work directly with the 
Rekall POC to determine which network ranges are in-scope for the scheduled assessment.  
 
It is Rekall's responsibility to ensure that IP addresses identified as in-scope are actually controlled 
by Rekall and are hosted in Rekall-owned facilities (i.e., are not hosted by an external organization). 
In-scope and excluded IP addresses and ranges are listed below.  
 
 
 
 
  


# Executive Summary of Findings
 
## Grading Methodology
 
Each finding was classified according to its severity, reflecting the risk each such vulnerability may 
pose to the business processes implemented by the application, based on the following criteria: 
 
Critical:   Immediate threat to key business processes. 
High:     Indirect threat to key business processes/threat to secondary business processes. 
Medium:   Indirect or partial threat to business processes.  
Low:     No direct threat exists; vulnerability may be leveraged with other vulnerabilities. 
Informational:    No threat; however, it is data that may be used in a future attack. 
 
As the following grid shows, each threat is assessed in terms of both its potential impact on the 
business and the likelihood of exploitation: 

![image_13](https://github.com/user-attachments/assets/65dcbf6c-3c02-4873-aabf-44a2bd396a44)

## Summary of Strengths
 
While the assessment team was successful in finding several vulnerabilities, the team also 
recognized several strengths within Rekall's environment. These positives highlight the effective 
countermeasures and defenses that successfully prevented, detected, or denied an attack technique 
or tactic from occurring.  
 
- Day 1 Flag 2

: XXS Reflected (advanced) 
o  The application attempted to filter user input to prevent XSS attacks, showing that 
some basic security measures were in place to defend against malicious scripts. 
 
 
## Summary of Weaknesses
 
We successfully found several critical vulnerabilities that should be immediately addressed in order 
to prevent an adversary from compromising the network. These findings are not specific to a 
software version but are more general and systemic vulnerabilities. 
 
- Day 1 flag 1

: XSS Reflected 
o  The Welcome.php page is vulnerable to reflected cross-site scripting (XSS) 
because it displays user input without sanitization. This allows an attacker to inject 
malicious scripts into the URL, which run in a victim's browser and could steal 
cookies, hijack sessions, or redirect users to malicious websites. 
- Day 1 flag 2

: XSS Reflected (Advanced) 
o  The Memory-Planner.php page is vulnerable to advanced reflected XSS due to 
weak input filtering that only removes obvious keywords like "script." Attackers can 
bypass the filter with obfuscated payloads, leading to remote script execution that 
can compromise user accounts, steal data, or launch further attacks from the user's 
session. 
- Day 1 Flag 3

 : XSS Stored 
o  The comments.php page is vulnerable to Stored Cross-Site Scripting (XSS) 
because it saves and displays user input without sanitizing it. An attacker can inject 
malicious JavaScript into a comment, which will automatically execute whenever 
anyone views the page. 
- Day 1 Flag 4

: Sensitive data exposure 
o  The web server exposed sensitive information (a hidden flag) in the HTTP response 
headers, which could be easily discovered by inspecting network traffic or page 
source. 
- Day 1 Flag 5

 : Local file inclusion 
o  The Memory-Planner.php page allowed users to upload files without properly 
validating the file type or contents. This vulnerability enabled attackers to upload a 
malicious PHP file disguised as an image, which was then executed by the server. 
As a result, attackers could run arbitrary code remotely, leading to full system 
compromise and potential data breaches. 
- Day 2 Flag 1

: Open source exposed data 
o  Sensitive information was exposed through publicly available WHOIS data, revealing 
internal details that should have been kept private. This is dangerous because 
attackers can use such information to plan targeted attacks, perform social 
engineering, or map out the organization's infrastructure for future exploitation. 
- Day 2 Flag 2

: Exposed IP Address: 
o  An exposed IP address was discovered through basic DNS resolution, revealing the 
real server location behind the domain. This is dangerous because it allows attackers 
to directly target the server with scanning, enumeration, and exploitation attempts, 
bypassing any protections that might exist at the domain level. 
- Day 2 Flag 3

: Open-source exposed data 
 
  


o  A sensitive subdomain was exposed through public SSL certificate transparency 
logs. This is dangerous because attackers can find hidden infrastructure, map 
additional targets, and plan deeper attacks against overlooked or less-protected 
subdomains. 
- Day 2 Flag 4

: Host Enumeration 
o  A network scan revealed five active hosts on the target subnet. This is dangerous 
because attackers can identify live systems, map out the network, and prioritize 
targets for further exploitation. 
- Day 2 Flag 5

: nmap 
o  An aggressive Nmap scan revealed that a host was running a publicly accessible 
Drupal instance. This is dangerous because unpatched Drupal systems are 
commonly targeted for remote code execution vulnerabilities. 
- Day 3 Flag1: OSINT 
o  Public credential information was found in a GitHub repository, where a user 
password hash was exposed. This is dangerous because attackers can crack the 
hash offline and reuse valid credentials to access protected systems. 
- Day 3 Flag 2

: HTTP enumeration 
o  An exposed HTTP login page was discovered through network scanning. Using 
leaked credentials, attackers were able to authenticate and access sensitive internal 
files. This is dangerous because it allows unauthorized access without exploiting 
vulnerabilities --- simply by reusing found credentials. 
- Day 3 Flag 3

: FTP Enumeration: 
o  The FTP service allowed anonymous login without authentication, exposing sensitive 
files. This is dangerous because attackers can download internal files, gather 
reconnaissance information, and move further into the environment without needing 
valid credentials. 
- Day 3 Flag 4

: Metosploit 
o  A vulnerable SLMail service was discovered and successfully exploited using a 
known buffer overflow vulnerability. This is dangerous because it allows an attacker 
to gain a full Meterpreter shell on the system, leading to complete remote control. 
- Day 3 Flag 5

: Common Tasks 
o  After gaining a Meterpreter shell on the system, an unsecured scheduled task 
containing sensitive information was found. This is dangerous because attackers can 
use misconfigured tasks to gather flags, escalate privileges, or execute further 
payloads. 
 
 
 
 
  


# Executive Summary
 
[Provide a narrative summary of your steps and findings, including screenshots. It's fine to mention 
specifics (e.g., used Metasploit to exploit a vulnerable version of DistCC), but do not get too 
technical in these specifics. This should be an A--Z summary of your assessment.] 
 
- High-level summary of weaknesses here 
- Day 1 flag 1

: XSS Reflected 
 
In the "Welcome" page of the Rekall website, there is a text input field we can manipulate to have 
specific outputs. I tested this by writing "<script>alert("i waz here")</script>" into the input field: 

![image](https://github.com/user-attachments/assets/3b35178f-ae37-4cf8-a691-d3234ddd1f2c)

This gave me the alert as presented below, giving us clear indication of a XSS vulnerability.

![image](https://github.com/user-attachments/assets/3bc1a61a-53b6-43d4-8681-e033bd25465b)

- Day 1 flag 2

: XSS Reflected (Advanced) 
In the "VR Planner" page, the ability to use specific coding logic seems to be nulled. Although the 
application performs basic input filtering by removing instances of the word "script," it fails to prevent 
more creative HTML tag splitting techniques. In the example below, I used 
"<SCRIPscriptT>alert("This is an attack")</SCRIPscripTt>" as seen here:

![image](https://github.com/user-attachments/assets/84e5b6a2-495a-4c47-a5f8-7edf5ca45ac4)
 
And received the reflected output here:  

![image](https://github.com/user-attachments/assets/dc8e6f05-f906-46ed-b47a-76de8fbf36c5)

- Day 1 flag 3

: XSS Stored 
This vulnerability is seen in the Welcome page in the comments section. By inserting malicious script 
into the commenting section, it will be stored and saved. In this example, I typed "<script>alert("XSS 
Attack")</script>" into the comment box:  
 
![image](https://github.com/user-attachments/assets/fedc2001-1c23-462b-9dc7-0e2779f8efd3)

It gave this output, and will continue to give me this output everytime i open the page from now on 
until the comment is removed.

![image](https://github.com/user-attachments/assets/3cdf3a5b-27c7-4132-a8db-7eb18b9b8090)

- Day 1 Flag 4

: Sensitive data exposure 
By looking at the HTTP response of the "About Rekall" page, we can see sensitive 
information such as flag 4.  
 
![image](https://github.com/user-attachments/assets/2514eb6d-6f34-43e8-86c2-efa501f44a3d)

![image](https://github.com/user-attachments/assets/15b5332e-ee19-46ad-b551-3079b372a517)

 
- Day 1 Flag 5

: Local file inclusion 
The file upload functionality allowed uploading of a PHP script disguised as an image, leading 
to unauthorized file execution on the server. 

![image](https://github.com/user-attachments/assets/e62ec515-15db-4147-bae3-2c31f15556b0)

- Day 2 Flag 1

: Open source exposed data 
The domain totalrekall.xyz exposed sensitive information through its publicly available WHOIS 
registration data. By inspecting the WHOIS record, the flag was found listed in the "Registrant 
Street" field. 
 
![image](https://github.com/user-attachments/assets/e70c7463-6ffe-4d7c-a943-96a4d5bee36a)
 
- Day 2 Flag 2

: Exposed IP Address 
A direct DNS resolution of the target domain revealed the server's true public IP address. Without 
any masking through a Content Delivery Network (CDN) or reverse proxy, attackers can easily 
discover and directly target the backend server for further enumeration, port scanning, and 
exploitation. I did this with a simple nslookup on linux 
 
![image](https://github.com/user-attachments/assets/6c621e68-cbbd-4a36-984e-253e18edf520)
 
- Day 2 Flag 3

: Open-source exposed data 
A search on the Certificate Transparency database (crt.sh) for the organization's domain revealed 
a previously hidden subdomain (s7euwehd.totalrekall.xyz). Certificate Transparency logs are 
publicly accessible and often reveal internal or staging subdomains unintentionally exposed. This 
leaked subdomain can become a new target for attackers looking for less-secure parts of the 
infrastructure. 

![image](https://github.com/user-attachments/assets/a1dd6cd4-fa14-4f82-b191-b8024352debf)
 
- Day 2 Flag 4

: Host Enumeration 
An Nmap scan across the subnet revealed five active hosts on the network. Host discovery allows 
attackers to build a network map and select specific systems to probe for vulnerabilities, making it 
easier to plan targeted attacks. 

![image](https://github.com/user-attachments/assets/a266b256-0b56-4da9-9506-f251f46e747f)

- Day 2 Flag 5

: nmap 
An aggressive Nmap scan (-A flag) identified that the host at 192.168.13.13 was running a web 
server with Drupal installed. Publicly exposed content management systems (CMS) like Drupal are 
frequent targets for exploitation, especially if they are outdated or misconfigured. 

![image](https://github.com/user-attachments/assets/84e36c58-aee5-42f2-a2e8-6bd9331d3227)

- Day 3 Flag 1

: OSINT 
A search through public GitHub repositories revealed a file containing user credentials for the target 
organization:
 
![image](https://github.com/user-attachments/assets/a322f525-7504-4cd4-847c-597d52a5eb9b)
 
The password was stored as an Apache MD5 hash ($apr1$). Using a password cracking tool like 
john, the hash was successfully cracked to reveal the plaintext password "Tanya4life". Public 
exposure of internal credentials significantly weakens organizational security: 

![image](https://github.com/user-attachments/assets/205da879-8fee-4c1a-968e-f4d08857e63b)

- Day 3 Flag 2

: Http Enumeration 
A network scan revealed that host 172.22.117.20 was running an HTTP service on port 80. 
 
![image](https://github.com/user-attachments/assets/910145ab-6adc-4975-b11f-3035aee5c550)

Visiting the site triggered a login prompt. Using the credentials (trivera:Tanya4life) previously 
obtained through OSINT (Flag 1), successful login was achieved:

![image](https://github.com/user-attachments/assets/ce8333e4-ad16-403d-9bf4-e2da0cd4c2cc)
 
- Day 3 Flag 3

: FTP Enumeration 
During a service scan, port 21 (FTP) on 172.22.117.20 was found open: 

![image](https://github.com/user-attachments/assets/570c9a84-86d5-42ec-9270-9ceceecabf19)

Testing the service showed that anonymous login was enabled, allowing unauthenticated users to 
access the server. The flag file flag3.txt was found and downloaded directly without credentials: 

![image](https://github.com/user-attachments/assets/aad34001-b76f-42d4-851d-6f6b5a0d6fc9)
 
- Day 3 Flag 4

: Metasploit 
Service enumeration revealed that the SLMail server was running on port 110 (POP3): 
 
![image](https://github.com/user-attachments/assets/a1d0904e-fd23-4151-ad46-1a0f0ed786af)


 
Using Metasploit's known exploit for SLMail, a buffer overflow was performed, resulting in a 
Meterpreter shell on the system. Inside the compromised environment, the flag flag4.txt was 
located and retrieved: 

![image](https://github.com/user-attachments/assets/36bcfa02-2958-45e2-aa53-36f23225bd24)
 
- Day 3 Flag 5

: Common Tasks 
While inside the compromised SLMail system (via Meterpreter), enumeration of scheduled tasks 
revealed a task named flag5: 
 
![image](https://github.com/user-attachments/assets/201691b5-3bf3-4db5-b8a7-eadcee2e96c9)
 
Using command-line tools inside Meterpreter, the task details were queried and contained sensitive 
information, including the flag: 
 
![image](https://github.com/user-attachments/assets/c9a3a3ea-1a94-4846-b41f-1ab5930a87d9)
 
# Summary Vulnerability Overview
 
## Summary Vulnerability Overview

| **Vulnerability** | **Severity** |
| :--- | :--- |
| Day 1 flag 1: XSS Reflected<br>Details:<br>info about xss reflected<br>what it does to them<br>how to fix | 🔴 **Critical** |
| Day 1 flag 2: XSS Reflected (Advanced) | 🔴 **Critical** |
| Day 1 flag 3: XSS Stored | 🔴 **Critical** |
| Day 1 Flag 4: Sensitive data exposure | 🔴 **Critical** |
| Day 1 Flag 5: Local file inclusion | 🔴 **Critical** |
| Day 2 Flag 1: Open source exposed data | 🟠 **High** |
| Day 2 Flag 2: Exposed IP Address | 🟠 **High** |
| Day 2 Flag 3: Open-source exposed data | 🔵 **Medium** |
| Day 2 Flag 4: Host Enumeration | 🔵 **Medium** |
| Day 2 Flag 5: nmap | 🟠 **High** |
| Day 3 Flag 1: OSINT | 🔴 **Critical** |
| Day 3 Flag 2: Http Enumeration | 🔴 **Critical** |
| Day 3 Flag 3: FTP Enumeration | 🔴 **Critical** |
| Day 3 Flag 4: Metasploit | 🔴 **Critical** |
| Day 3 Flag 5: Common Tasks | 🔴 **Critical** |

The following summary tables represent an overview of the assessment findings for this penetration 
test: 
 
## Scan Results

| **Scan Type** | **Total** |
| :--- | :--- |
| Hosts | 192.168.14.35<br>76.223.105.230<br>192.168.13.10<br>192.168.13.11<br>192.168.13.12<br>192.168.13.13<br>192.168.13.14<br>172.22.117.20 |
| Ports | **Port 21** : FTP<br>**Port 22** : SSH<br>**Port 25** : SMTP<br>**Port 80** : HTTP<br>**Port 110** : POP3<br>**Port 443** : HTTPS |

## Exploitation Risk Overview

| **Exploitation Risk** | **Total** |
| :--- | :--- |
| 🔴 **Critical** | 11 |
| 🟠 **High** | 2 |
| 🔵 **Medium** | 2 |
| 🟢 **Low** | 0 | 
 
# Vulnerability Findings

## Vulnerability 1
 
| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 1 Flag 1: XSS Reflected |
| **Type (Web app / Linux OS / Windows OS)** | Web Application |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | The Rekall VR Planning welcome page is vulnerable to reflected cross-site scripting (XSS). Unsanitized user input passed through the payload parameter in the URL is directly rendered in the HTML, allowing the execution of arbitrary JavaScript in the victim's browser. |
| **Images** | Input: <br> ![image](https://github.com/user-attachments/assets/46e57694-c1a1-44cb-a3e8-0d7291da13d9) | 
| **Images** | Output: <br> ![image](https://github.com/user-attachments/assets/72a9e94b-aec4-408d-af90-48d0c93a306c) | 
| **Affected Hosts** | 192.168.14.35 |
| **Remediation** | - Implement output encoding (e.g., use `htmlspecialchars()` in PHP).<br>- Use a framework that provides built-in XSS protections.<br>- Implement a Content Security Policy (CSP) |

## Vulnerability 2

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 1 flag 2: Reflected Cross-Site Scripting – Memory-Planner Input |
| **Type** | Web Application |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | The first field in Memory-Planner.php is vulnerable to reflected XSS. The application attempts to block inputs by removing the string "script"; however, attackers can bypass this by obfuscating the tag using split or mixed-case formatting. This allows JavaScript to execute in the browser. |
| **Images** | Input: <br> ![image](https://github.com/user-attachments/assets/94f06f19-583f-4f93-b352-a1fa13d64c10) | 
| **Images** | Output: <br> ![image](https://github.com/user-attachments/assets/0a215342-cc1d-4c8b-a309-db52c91004f3) | 
| **Affected Hosts** | 192.168.14.35 |
| **Remediation** | - Use a robust input sanitizer like DOMPurify or built-in framework sanitization<br>- Implement Content Security Policy (CSP) headers<br>- Do not reflect raw user input back into HTML pages |

## Vulnerability 3

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 1 Flag 3: XSS Stored |
| **Type** | Web Application |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | The comments.php page is vulnerable to stored XSS. When a user submits a comment containing JavaScript, the content is saved without proper sanitization and later rendered directly into the HTML of the page. This allows persistent client-side code execution in the context of any user viewing the page. |
| **Images** | Input: <br> ![image](https://github.com/user-attachments/assets/a2dc0a93-33f1-44c9-9eb8-463750ec6bc9) | 
| **Images** | Output: <br> ![image](https://github.com/user-attachments/assets/a0c5de70-0ddf-46e1-8671-20ecc97e46e2) | 
| **Affected Hosts** | 192.168.14.35 |
| **Remediation** | - Sanitize and encode user input on both client and server sides.<br>- Do not render raw HTML from user input.<br>- Use a security-focused library like DOMPurify to filter unsafe content.<br>- Implement a strong Content Security Policy (CSP). |

## Vulnerability 4

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 1 Flag 4: Sensitive data exposure |
| **Type** | Web Application |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | The About-Rekall.php page returns an internal flag value (nckd97dk6sh2) in its HTTP response headers. This constitutes a sensitive data leak and could lead to information disclosure about internal variables, debugging flags, or backend logic. |
| **Images** | Input: <br> ![image](https://github.com/user-attachments/assets/9cd95caf-9a46-4086-8536-8049b3044dcf) | 
| **Images** | Output: <br> ![image](https://github.com/user-attachments/assets/1daa2ea2-ba22-4f60-aea4-5cb13deb5166) | 
| **Affected Hosts** | 192.168.14.35 |
| **Remediation** | - Remove sensitive data from HTTP headers in production environments.<br>- Disable verbose or debug headers.<br>- Conduct regular manual and automated security audits to check for this type of information disclosure. |

## Vulnerability 5

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 1 Flag 5: Local file inclusion |
| **Type** | Web Application |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | The second field on Memory-Planner.php accepts file uploads but fails to enforce file type validation or content inspection. This allows attackers to upload and execute malicious PHP files. Sensitive files are stored in an accessible directory and executed by the server, leading to Local File Inclusion (LFI) and possible Remote Code Execution (RCE). |
| **Images** | ![image](https://github.com/user-attachments/assets/7088c4c2-df09-4427-bee1-b5e01d4ec35c) | 
| **Affected Hosts** | 192.168.14.35 |
| **Remediation** | - Restrict file types (e.g., only allow .jpg, .png, etc.)<br>- Validate file contents and MIME type<br>- Rename and store files outside the web root<br>- Disable execution permissions on uploaded file directories<br>- Consider using third-party libraries for secure upload handling |

## Vulnerability 6

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 2 flag 1: Open source exposed data |
| **Type** | Web Application |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | Using publicly available WHOIS data, the flag was discovered in the “Registrant Street” field. This reveals potentially sensitive internal naming or identifiers that could be used for social engineering or passive recon. |
| **Images** | ![image](https://github.com/user-attachments/assets/2ac1047c-4043-488c-a628-ede0c32e864b) | 
| **Affected Hosts** | 76.223.105.230 |
| **Remediation** | - Use privacy protection services or redacted WHOIS records for sensitive domain registrations. |

## Vulnerability 7

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 2 Flag 2: Exposed IP Address |
| **Type** | Linux OS |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | The IP address of the totalrekall.xyz domain can be easily resolved via ping or nslookup, revealing backend infrastructure and aiding in target scoping. |
| **Images** | ![image](https://github.com/user-attachments/assets/50d0a5f3-a434-453a-96c6-0426ee0c0744) | 
| **Affected Hosts** | 76.223.105.230 |
| **Remediation** | - Use reverse proxies, CDNs, or cloud firewall services to hide origin IPs. |

## Vulnerability 8

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 2 Flag 3: Open-source exposed data |
| **Type** | Web Application |
| **Risk Rating** | 🔹 **Medium** |
| **Description** | By searching public SSL certificate logs on crt.sh, a certificate was found issued for a subdomain: s7euwehd.totalrekall.xyz, which directly leaks the flag. |
| **Images** | ![image](https://github.com/user-attachments/assets/43ef82cc-43d2-40e3-bd97-61f0f60879f3) | 
| **Affected Hosts** | 76.223.105.230 |
| **Remediation** | - Avoid embedding sensitive tokens in subdomain names or certificates.<br>- Use environment-neutral identifiers. |

## Vulnerability 9

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 2 Flag 4: Host Enumeration |
| **Type** | Linux |
| **Risk Rating** | 🔹 **Medium** |
| **Description** | An nmap ping sweep across the 192.168.13.0/24 subnet identified 6 total hosts, including the attacker's. |
| **Images** | ![image](https://github.com/user-attachments/assets/505af56d-2b43-4bbf-8fd5-9056bf79a96e) | 
| **Affected Hosts** | 192.168.13.10, 192.168.13.11, 192.168.13.12, 192.168.13.13, 192.168.13.14 |
| **Remediation** | - Implement firewalls or intrusion prevention systems to detect/limit ICMP-based enumeration. |

## Vulnerability 10

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 2 Flag 5: nmap |
| **Type** | Linux OS |
| **Risk Rating** | 🟠 **High** |
| **Description** | An aggressive Nmap scan revealed that the host 192.168.13.13 is running Drupal, specifically version 8. This is vulnerable to known exploits and should be hardened or removed. |
| **Images** | ![image](https://github.com/user-attachments/assets/d51fffe1-b3b4-4287-b68f-d465df49e6d1) | 
| **Affected Hosts** | 192.168.13.13 |
| **Remediation** | - Restrict public access<br>- Patch the CMS<br>- Disable default files like INSTALL.txt or README.txt. |

## Vulnerability 11

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 3 Flag 1: OSINT |
| **Type** | Web Application/Linux OS |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | Credentials were found in a public GitHub repository (xampp.userspage) associated with totalrekall.xyz. One of the exposed user hashes was in Apache $apr1$ (MD5-based) format. Using john and a wordlist, the hash was successfully cracked. |
| **Images** | Input: <br> ![image](https://github.com/user-attachments/assets/169bc863-e9a2-445c-80f4-79350be077d9) | 
| **Images** | Output: <br> ![image](https://github.com/user-attachments/assets/140ea79e-dc09-4b20-ae9f-042b2e5626ff) | 
| **Affected Hosts** | 172.22.117.20 |
| **Remediation** | - Remove sensitive data from public repos<br>- Use stronger hashing algorithms like bcrypt or Argon2<br>- Enforce password complexity rules |

## Vulnerability 12

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 3 Flag 2: Http Enumeration |
| **Type** | Web Application |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | The web service running on 172.22.117.20 required HTTP Basic Authentication. Using credentials found in Flag 1 (trivera:Tanya4life), login was successful. Inside the page, a file flag2.txt was discovered containing the flag. |
| **Images** | ![image](https://github.com/user-attachments/assets/c50cb793-22fa-4f8e-b9aa-51b61a2e61a2) | 
| **Affected Hosts** | 172.22.117.20 |
| **Remediation** | - Avoid exposing HTTP services publicly unless absolutely necessary<br>- Use secure authentication methods (e.g., token-based or MFA)<br>- Remove sensitive files from web directories<br>- Log access attempts and monitor for credential abuse |

## Vulnerability 13

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 3 Flag 3: FTP Enumeration |
| **Type** | Linux OS |
| **Risk Rating** | 🟠 **High** |
| **Description** | The FTP server at 172.22.117.20 allowed anonymous logins without credentials. Attackers could list and download sensitive files like flag3.txt. |
| **Images** | Input: <br> ![image](https://github.com/user-attachments/assets/c280a5a1-6aa5-46bb-b898-91617ddf16d9) | 
| **Images** | Output: <br> ![image](https://github.com/user-attachments/assets/56bb067c-93ca-4786-8130-eebd36ecc68e) | 
| **Affected Hosts** | 172.22.117.20 |
| **Remediation** | - Disable anonymous FTP or restrict directories<br>- Use SFTP with authentication<br>- Monitor and alert on anonymous logins |

## Vulnerability 14

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 3 Flag 4: Metasploit |
| **Type** | Linux OS |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | The POP3 service on 172.22.117.20 was running SLMail 3.03, known to be vulnerable to a buffer overflow. A Meterpreter shell was obtained. |
| **Images** | Input: <br> ![image](https://github.com/user-attachments/assets/96f5a924-a2d2-4601-86a5-33a56c111cf4) | 
| **Images** | Output: <br> ![image](https://github.com/user-attachments/assets/811b6ea8-3b3c-4e0e-bad5-25b7ae0b6159) | 
| **Affected Hosts** | 172.22.117.20 |
| **Remediation** | - Upgrade or remove vulnerable services<br>- Use segmentation to isolate exposed systems<br>- Employ IDS/IPS to monitor exploit attempts |

## Vulnerability 15

| **Field** | **Details** |
| :--- | :--- |
| **Title** | Day 3 Flag 5: Common Tasks |
| **Type** | Linux OS |
| **Risk Rating** | 🔴 **Critical** |
| **Description** | While inside a compromised system via Meterpreter, scheduled tasks were queried revealing sensitive task information. |
| **Images** | Input: <br> ![image](https://github.com/user-attachments/assets/f4671596-54eb-40ac-868c-b9b43bcb0b7f) | 
| **Images** | Output: <br> ![image](https://github.com/user-attachments/assets/cfac8533-129b-4e3e-a907-2e0cf5bd5621) | 
| **Affected Hosts** | 172.22.117.20 |
| **Remediation** | - Limit user visibility of scheduled tasks<br>- Avoid embedding secrets in task names or descriptions<br>- Use system-level logging and task hardening |
