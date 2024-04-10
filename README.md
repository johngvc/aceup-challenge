# Project Nuuvem app

Name: João Gabriel Vezza Campos

## Project description
You've received a text file (tab separated) with data describing the company sales. We need a way for this data to be imported to a database to be analyzed later.
Your job is to create a web interface that accepts file uploads, normalizes the data and stores it in a relational database.
Your application MUST:

1. Accept (via HTML form) file uploads of TAB-separated files, with the following columns: purchaser name, item description, item price, purchase count, merchant address, merchant name. You can assume the columns will always be in that order, and that there will always be some value in each column, and that there will always be a header row. An example file called example_input.tab is included on this repo.
2. Interpret (parse) the received file, normalize the data, and save the data correctly in a relational database. Don't forget to model the entities imported from the file data, considering their relationships.
3. Show the total gross income represented by the sales data after each file upload, and also the total all-time gross income.
4. Be written in Ruby 2.7 or greater (or, in the language solicited by the job description, if any).
5. Have good automated tests coverage.
6. Be simple to configure and execute, running on a Unix-compatible environment (Linux or macOS).
7. Use only free / open-source language and libraries.

## Acceptance criteria

* Does the application fulfill the basic requirements?
* Did you document how to configure and run the application?
* Did you follow closely the project specification?
* Quality of the code itself, how it's strutured and how it complies with good object-oriented practices;
* Quality and coverage of unit / funcional / automated tests;
* Familiarity with the standard libraries of the language and other packages;

## Installing the app

### 1. Install Docker

#### Install Docker Desktop on Windows (<a href="https://docs.docker.com/desktop/install/windows-install/">guide source</a>)
##### Install interactively

* Double-click Docker Desktop Installer.exe to run the installer. If you haven’t already downloaded the installer (Docker Desktop Installer.exe), you can get it from Docker Hub. It typically downloads to your Downloads folder, or you can run it from the recent downloads bar at the bottom of your web browser.

* When prompted, ensure the Use WSL 2 instead of Hyper-V option on the Configuration page is selected or not depending on your choice of backend.

* If your system only supports one of the two options, you will not be able to select which backend to use.

* Follow the instructions on the installation wizard to authorize the installer and proceed with the install.

* When the installation is successful, click Close to complete the installation process.

* If your admin account is different to your user account, you must add the user to the docker-users group. Run Computer Management as an administrator and navigate to Local Users and Groups > Groups > docker-users. Right-click to add the user to the group. Log out and log back in for the changes to take effect.


##### Start Docker Desktop

* Docker Desktop does not start automatically after installation. To start Docker Desktop:

* Search for Docker, and select Docker Desktop in the search results.

* search for Docker app

* The Docker menu (<img src="/desktop/install/images/whale-x.svg" alt="whale menu" class="inline">) displays the Docker Subscription Service Agreement window.

Here’s a summary of the key points:
  * Docker Desktop is free for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
  * Otherwise, it requires a paid subscription for professional use.
  * Paid subscriptions are also required for government entities.
  * The Docker Pro, Team, and Business subscriptions include commercial use of Docker Desktop.

* Select Accept to continue. Docker Desktop starts after you accept the terms.

  **Important**

  If you do not agree to the terms, the Docker Desktop application will close and you can no longer run Docker Desktop on your machine. You can choose to accept the terms at a later date by opening Docker Desktop.

For more information, see Docker Desktop Subscription Service Agreement. We recommend that you also read the FAQs.

#### Install Docker Desktop on Ubuntu (<a href="https://docs.docker.com/desktop/install/ubuntu/">guide source</a>)

This page contains information on how to install, launch and upgrade Docker Desktop on an Ubuntu distribution.

##### Prerequisites
To install Docker Desktop successfully, you must:

* Meet the system requirements
* Have a 64-bit version of either Ubuntu Jammy Jellyfish 22.04 (LTS) or Ubuntu Impish Indri 21.10. Docker Desktop is supported on x86_64 (or amd64) architecture.
* Uninstall the tech preview or beta version of Docker Desktop for Linux. Run:

<pre><code>sudo apt remove docker-desktop
</code></pre>

For a complete cleanup, remove configuration and data files at $HOME/.docker/desktop, the symlink at /usr/local/bin/com.docker.cli, and purge the remaining systemd service files.

 <pre><code>rm -r $HOME/.docker/desktop
 sudo rm /usr/local/bin/com.docker.cli
 sudo apt purge docker-desktop</code></pre>

**Note**
If you have installed the Docker Desktop for Linux tech preview or beta version, you need to remove all files that were generated by those packages (e.g., ~/.config/systemd/user/docker-desktop.service, ~/.local/share/systemd/user/docker-desktop.service).

Additionally, for non-Gnome Desktop environments, gnome-terminal must be installed:

<pre><code>sudo apt install gnome-terminal</code></pre>


##### Install Docker Desktop
Recommended approach to install Docker Desktop on Ubuntu:

1. Set up Docker’s package repository.

2. Download latest DEB package.

3. Install the package with apt as follows:

<pre><code>sudo apt-get update
 sudo apt-get install ./docker-desktop-<version>-<arch>.deb</code></pre>
 

Note
At the end of the installation process, apt displays an error due to installing a downloaded package. You can ignore this error message.

 N: Download is performed unsandboxed as root, as file '/home/user/Downloads/docker-desktop.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)


There are a few post-install configuration steps done through the post-install script contained in the deb package.

The post-install script:

* Sets the capability on the Docker Desktop binary to map privileged ports and set resource limits.
* Adds a DNS name for Kubernetes to /etc/hosts.
* Creates a link from /usr/bin/docker to /usr/local/bin/com.docker.cli.


##### Launch Docker Desktop
To start Docker Desktop for Linux, search Docker Desktop on the Applications menu and open it. This launches the whale menu icon and opens the Docker Dashboard, reporting the status of Docker Desktop.

Alternatively, open a terminal and run:

 <pre><code>systemctl --user start docker-desktop</code></pre>

When Docker Desktop starts, it creates a dedicated context that the Docker CLI can use as a target and sets it as the current context in use. This is to avoid a clash with a local Docker Engine that may be running on the Linux host and using the default context. On shutdown, Docker Desktop resets the current context to the previous one.

The Docker Desktop installer updates Docker Compose and the Docker CLI binaries on the host. It installs Docker Compose V2 and gives users the choice to link it as docker-compose from the Settings panel. Docker Desktop installs the new Docker CLI binary that includes cloud-integration capabilities in /usr/local/bin and creates a symlink to the classic Docker CLI at /usr/local/bin/com.docker.cli.

After you’ve successfully installed Docker Desktop, you can check the versions of these binaries by running the following commands:

<pre><code>docker compose version
 docker --version
 docker version</code></pre>
 
To enable Docker Desktop to start on login, from the Docker menu, select Settings > General > Start Docker Desktop when you log in.

Alternatively, open a terminal and run:

<pre><code>systemctl --user enable docker-desktop</code></pre>
 
To stop Docker Desktop, click on the whale menu tray icon to open the Docker menu and select Quit Docker Desktop.

Alternatively, open a terminal and run:

<pre><code>systemctl --user stop docker-desktop</code></pre>
 
### 2. Install the docker-compose tool

**if you're on windows it will come bundled with Docker Desktop**

#### Linux - Install using the repository (<a href="https://docs.docker.com/compose/install/linux/#install-using-the-repository">guide source</a>)

**Note**
These instructions assume you already have Docker Engine and Docker CLI installed and now want to install the Compose plugin.
For Compose standalone, see Install Compose Standalone.

If you have already set up the Docker repository, jump to step 2.

1. Set up the repository. Find distro-specific instructions in:

<a href="https://docs.docker.com/engine/install/ubuntu/#set-up-the-repository">Ubuntu</a> |
 <a href="https://docs.docker.com/engine/install/centos/#set-up-the-repository">CentOS</a> |
 <a href="https://docs.docker.com/engine/install/debian/#set-up-the-repository">Debian</a> |
 <a href="https://docs.docker.com/engine/install/fedora/#set-up-the-repository">Fedora</a> |
 <a href="https://docs.docker.com/engine/install/rhel/#set-up-the-repository">RHEL</a> |
 <a href="https://docs.docker.com/engine/install/sles/#set-up-the-repository">SLES</a>

2. Update the package index, and install the latest version of Docker Compose:

* Ubuntu, Debian:

<pre><code>sudo apt-get update
 sudo apt-get install docker-compose-plugin</code></pre>
 
* RPM-based distros:

<pre><code>sudo yum update
 sudo yum install docker-compose-plugin</code></pre>

3. Verify that Docker Compose is installed correctly by checking the version.

<pre><code>docker compose version</code></pre>
 
Where vN.N.N is placeholder text standing in for the latest version.


### 3. Launch the project using docker-compose tool

* The project consists of 2 containers working simultaneously, to start the program we need to run on the root of the project:

<pre><code>docker-compose up</code></pre>

* Both containers, one with PostgreSQL and another with the main Rails app will be launched

* If necessary the port 8080 of the posgreSQL container will be exposed to connect database managing solutions like DBeaver

* to run automated tests, while the containers are running do:

<pre><code>docker container list</code></pre>

* This will get all current containers on docker, then get the "nuuvem-app_backend" container ID from the response

![image](https://user-images.githubusercontent.com/42398896/194214144-6a58b460-7e56-4a57-8638-d274245808df.png)

* With the container ID run:

<pre><code>docker exec -it <CONTAINER_ID> bash
# example
docker exec -it 4c1f52876610 bash
</code></pre>

* Finally run rspec with:

<pre><code>bundle exec rspec</code></pre>

* When done, shut down the containers by using:

<pre><code>docker-compose down</code></pre>

### 4. Access the backoffice utility of the application

* To access the backoffice utility go to http://localhost:3000/admin

**I've decided to use the back-office utility to better represent a real world scenario where the provided sales report
would be used by the back-office to update the database with new data.**

### 5. Log in with the mock user

* The credentials will be
  * Email: admin@example.com
  * Password: password

![image](https://user-images.githubusercontent.com/42398896/194209884-5e16a4f9-5e8c-4a66-bef6-15d3cb6ba5ec.png)

### 6. Submit new sale report

![image](https://user-images.githubusercontent.com/42398896/194210483-e1378a1c-058f-444e-b6d5-ef83f47ac8b9.png)

### 6. Submit sales report file

![image](https://user-images.githubusercontent.com/42398896/194210553-6e458a0c-23b9-468f-a7ac-ff3ccdcd5076.png)

![image](https://user-images.githubusercontent.com/42398896/194210668-2e6c86d2-12f9-46aa-b919-9384fee97830.png)

### 7. Check if process was successful alongside with report gross sum and total gross income

![image](https://user-images.githubusercontent.com/42398896/194210838-e6ce2777-21bd-415c-ad7a-1bc247329011.png)

### 8. Optional - Check the Items, Merchants, Purchasers, Purchases and Sales Reports imported

![image](https://user-images.githubusercontent.com/42398896/194210901-54d975f0-3dc6-4d83-b70c-215b098bbbc1.png)

### 9. Optional - Re upload failed reports and older reports if neccessary

![image](https://user-images.githubusercontent.com/42398896/194211300-500f054b-f24d-4f1b-878e-ddfd74fb3e2c.png)

![image](https://user-images.githubusercontent.com/42398896/194211404-e3098ac4-2cb6-4d33-95f5-87d7dffa175e.png)

-----------------------------------------------------------------------------------------------------------------------------------

# This project used the amazing rails api boilerplate project provided by the good folks at loopstudio - more info about the boilerplate below 👇


![image](https://user-images.githubusercontent.com/15303963/84329647-a19cc180-ab5b-11ea-9469-09606895bbbf.png)

<div align="center"><strong>Start your next Rails 6 API project in seconds</strong></div>

![Github Actions badge](https://github.com/loopstudio/rails-api-boilerplate/workflows/Tests%20and%20Linters/badge.svg)
[![Codebeat badge](https://codebeat.co/badges/eaad967a-50bd-41b9-be06-e59a516cb732)](https://codebeat.co/a/loopstudio/projects/github-com-loopstudio-rails-api-boilerplate-master)

<sub> Created and maintained with ❤️ by <a href="[https://loopstudio.dev/](https://loopstudio.dev/)">LoopStudio</a> </sub>

<div align="center">A foundation with a focus on performance and best practices</div>

## Table of Contents

- [Main Characteristics](#main-characteristics)
- [Gems](#gems)
- [Getting Started](#getting-started)
- [Code quality](#code-quality)
- [Contributing](#contributing)
- [License](#license)

## Main Characteristics

- Language: Ruby 2.7.2+
- Framework: Rails 6.0.3+
- Webserver: Puma
- Test Framework: RSpec
- Databases: Postgres & Redis
- Async Processor: Sidekiq

## Other Gems

#### dotenv-rails
For environment variables

#### Devise
We use [devise](https://github.com/plataformatec/devise) for authentication

#### Jb
For building API json views

#### ActiveAdmin
To build quick superadmin back-office features.

#### Pagy
For those endpoints that need pagination, you should add on the controller method, for example:
```ruby
pagy, records = pagy(User.all)
pagy_headers_merge(pagy)
render json: records
```
The frontend needs to pass the query param `page` to retrieve a specific page.

#### Nilify Blanks
The [nilify_blanks](https://github.com/rubiety/nilify_blanks) line on `ApplicationRecord` adds a before validation callback to substitute all blank string fields to be `nil` instead, to ensure no blank fields are saved on the db.

## Getting Started

1.  Make sure that you have Rails 6, PostgreSQL, Redis, git cli, and bundle installed.
2.  Clone this repo using `git clone --depth=1 https://github.com/LoopStudio/rails-api-boilerplate.git <YOUR_PROJECT_NAME>`
3.  Update the values of the `.env.template` file to match your app
4.  Create your `.env` file. You have an example at `.env.template`. You should be able to copy it and set your values.
    _It's a good practice to keep the `.env.template` updated every time you need a new environment variable._
5.  Run `bundle install`
6.  Run `bundle exec rake db:create`
7.  Run `bundle exec rake db:migrate`
8.  Run `bundle exec rake db:seed`
9.  Check the test are passing running `rspec`
    _At this point you can run `rails s`  and start making your REST API calls at `http://localhost:3000`_
10.  Edit or delete the `CODEOWNERS` file in `.github` directory
11. Edit this README file to match your project title and description
 _It's a good practice to keep this file updated as you make important changes to the installation instructions or project characteristics._
12. Delete the `.github/workflows/deploy.yml` file, and uncomment the other workflows or configure your continuous deployment workflow since you might use different environments.
13. Modify the `.github/CODEOWNERS` file

## Tests

You can run the unit tests with `rspec` or `rspec` followed by a specific test file or directory.

## Code Quality

With `rake linters` you can run the code analysis tool, you can omit rules with:

- [Rubocop](https://github.com/bbatsov/rubocop/blob/master/config/default.yml) Edit `.rubocop.yml`

  When you update RuboCop version, sometimes you need to change `.rubocop.yml`. If you use [mry](https://github.com/pocke/mry), you can update `.rubocop.yml` to the latest version automatically.

- [Reek](https://github.com/troessner/reek#configuration-file) Edit `config.reek`

Pass the `-a` option to auto-fix (only for some linterns).

## Job Monitor

Once the app is up and running, the route `/jobmonitor` will take you to the Sidekiq dashboard so you can see the status of the jobs.
This requires authentication only in production environments.

**Default Job Monitor Credentials:**
* Username: admin
* Password: admin

You change them to safer credentials by changing the env vars `JOB_MONITOR_USERNAME` and `JOB_MONITOR_PASSWORD`.

## Backoffice

Once the app is up and running, the route `/admin` will take you to the back-office built using ActiveAdmin.
The first Admin User is created when seeding if there isn't one created already.

**First Admin User Credentials:**
* Email: admin@example.com
* Password: password

For other environments other than development make sure you modify it to have safer credentials through the Rails console.

Once you log in as an Admin User you can manage other Admin Users from there.

You can change the Backoffice favico (tab icon) on `public/assets/` and match the filename on `config/initializers/active_admin.rb`.

## Continuous Deployment

**This boilerplate contains commented out code for a quick Continuous Deployment setup using Github actions and deploying to the Heroku platform.**

*(If you are not using those two tools you might simply want to remove the workflows directory and disregard the rest of these instructions.)*

Since we are used to using git-flow for branching and having **three different environments (dev, staging, and production)**, this boilerplate includes three commented out files on the `.github/workflows` folder so that, when using this repo for an actual project, you can keep these environments updated simply by doing a proper use of the branches.

* **Deploy to dev**: Triggered every time `develop` branch gets pushed to. For instance, whenever a new feature branch gets merged into the develop branch.

* **Deploy to staging**: Triggered every time somebody creates (or updates) a Pull Request to master. We usually call these branches using the format: `release/vx.y.z` but it will work regardless of the branch name. We create a release Pull Request at the end of each sprint to deploy to staging the new set of changes, and we leave the Pull Request `On Hold` until we are ready to ship to production.

* **Deploy to production**: Once the staging changes are approved by the Product Owner, we merge the release branch Pull Request into master, triggering a push on the master branch which deploys to production.

For this to work you will need the configure some Secrets on your GitHub repository. To add these go to your Github project, click on `Settings`, and then `Secrets`.

You need to add the following Secrets:

* **HEROKU_EMAIL**: Email of the owner account of the Heroku apps.
* **HEROKU_API_KEY**: API Key of the owner account of the Heroku apps. Get it by going to your Heroku account, `Account Settings`, and scroll down to reveal the `API KEY`.
* **HEROKU_DEV_APP**: Name of the development app. Eg. `my-project-develop-api`
* **HEROKU_PROD_APP**: Name of the production app. Eg. `my-project-api`
* **HEROKU_STAGING_APP**: Name of the staging app. Eg. `my-project-staging-api`

### Notes on Continuous Deployment

* You can disregard and remove the `deploy.yml` file since we use it to deploy the boilerplate code itself as we work on it, but it will probably be useless to you once you clone this repo for your real-world use case.

* If you use a different branching strategy or different environments layout, simply delete the files under the workflows directory and set up your own.

### Password reset flow

* Request for a password reset at `/users/password` with the following body:
```json
{
  "email": "<EMAIL_TO_CHANGE>"
}
```
Where `<EMAIL_TO_CHANGE>` should be a registered email or you will get the corresponding message on the response.

* An email is sent to that address with a 6 digit code.
* With a `GET` request to `users/password/edit?reset_password_token=<TOKEN>` you can verify the token validity.
* And to change the password you should send a `PUT` request to `users/password` with the following body:
```json
{
  "reset_password_token": "<TOKEN>",
  "password": "<NEW_PASSWORD>"
}
```

## Contributing

If you've noticed a bug or find something that needs to be refactored, feel free to open an issue or even better, a Pull Request!

## License

This project is licensed under the MIT license.

Copyright (c) 2020 LoopStudio.

For more information see [`LICENSE`](LICENSE)

--------

[<img src='https://loopstudio.dev/wp-content/uploads/2019/05/logoblack.png' width='300'/>](https://loopstudio.dev)
