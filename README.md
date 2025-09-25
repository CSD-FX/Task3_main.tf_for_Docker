# Task-3_Elevate_Labs
---
**Technologies Used:
--
Terraform – For defining and managing infrastructure as code
Docker – To run containerized applications (Colima (macOS) / Docker Desktop (Windows) – local Docker runtime)
shell script - To install terraform and docker in linux
___
**Project Overview:
--
 * This project uses Terraform to:
 * Pull a Docker image (nginx:latest)
 * Provision a Docker container running Nginx
 * Expose the container on a local port (8080)
 * Manage infrastructure lifecycle using Terraform commands (init, plan, apply, destroy)
---
**Prerequisites:
--
 * Install Terraform
 * Install Docker [Colima (macOS) / Docker Desktop (Windows)]
---

** MacOS
--
Step 1: Install Terraform & Colima
```bash
   # Update Homebrew
   brew update

   # Install Terraform
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform

   # Install Colima (Docker runtime)
   brew install colima docker
```
Verify Versions:
```bash
   terraform -version
   docker --version
   colima --version
```
--
Step 2: Start Colima (Docker Daemon)
```bash
   colima start
```
```bash
   # Check if docker is running
   docker ps
```
--
Step 3: Clone or Create Project Directory (Run on your terminal)
```bash
   git clone https://github.com/CSD-FX/Task3_main.tf_for_Docker.git
   cd Task3_main.tf_for_Docker && cd MacOS
```
* ⛔️ Change your local machine user name here:
     provider "docker" {
     host = "unix:///Users/<⛔️Your_local_user_name⛔️ >/.colima/default/docker.sock" 
--
Step 4: Run Terraform Commands
```bash
   terraform init
   terraform validate
   terraform plan
   terraform apply -auto-approve
```
--
Step 5: Check the docker container and terraform state:
```bash
   docker ps
```
```bash
   terraform state pull
   terraform state list
```
--
Step 6: Access the webpage deployed
 * Deployed on port 3000
 * Search on any search engine
   ```bash
   http://localhost:3000
   ```
--
Step 7: Destroy the Complete Infrastructure:
```bash
   terraform destroy
```

---

** WINDOWS
--
Step 1: Install Terraform And Docker Desktop
--
* Download Terraform for Windows:
* Extract the .zip to a folder (e.g., C:\Terraform)
* Add the folder to your PATH
* Press Win + S → Search “Environment Variables” → Edit PATH → Add C:\Terraform
* Verify:
```bash
   terraform -version
```
* Install Docker Desktop: Docker Desktop for Windows
* Enable WSL 2 integration if prompted.
* Start Docker Desktop → Wait for the whale icon ✅
Verify:
```bash
   docker ps
```
--
Step 2: Clone or Create Project Directory (Run on your terminal)
```bash
   git clone https://github.com/CSD-FX/Task3_main.tf_for_Docker.git
   cd Task3_main.tf_for_Docker && cd Windows
```
--
Step 3: Run Terraform Commands
```bash
   terraform init
   terraform validate
   terraform plan
   terraform apply -auto-approve
```
--
Step 4: Check the docker container and terraform state:
```bash
   docker ps
```
```bash
   terraform state pull
   terraform state list
```
--
Step 5: Access the webpage deployed
 * Deployed on port 3000
 * Search on any search engine
   ```bash
   http://localhost:3000
   ```
--
Step 6: Destroy the Complete Infrastructure:
```bash
   terraform destroy
```
---
**LINUX
--
Step 1: Clone or Create Project Directory:
```bash
   git clone https://github.com/CSD-FX/Task3_main.tf_for_Docker.git
   cd Task3_main.tf_for_Docker && cd EC2_Linux
```
Step 2: Run the sh file to download terraform and docker:
```bash
   chmod +x docker_and_terra.sh
   ./docker_and_terra.sh
```
Step 3: Run Terraform Commands
```bash
   sudo usermod -aG docker $USER
   terraform init
   terraform validate
   terraform plan
   terraform apply -auto-approve
```
--
Step 4: Check the docker container and terraform state:
```bash
   docker ps
```
```bash
   terraform state pull
   terraform state list
```
--
Step 5: Access the webpage deployed
 * Deployed on port 3000
 * Search on any search engine
   ```bash
   http://public IP:3000
   ```
--
Step 6: Destroy the Complete Infrastructure:
```bash
   terraform destroy
```

   
   
