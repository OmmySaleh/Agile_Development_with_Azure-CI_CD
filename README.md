[![Actions Status](https://github.com/OmmySaleh/MyDevOpsRepo/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)](https://github.com/OmmySaleh/MyDevOpsRepo/actions)

Building CI-CDpipeline- test

This project illustrates on how to build GitHub repository from the very beginning and creating a scaffolding that will assist in performing both Continuous integration and Continuous Delivery. The process followed the pathway below

 . Creating Github Actions together with a Makefile and a requirement.txt file
 . Application code to perform initial lint, test and install cycle.
 . Lastly integrating the project with Azure Pipelines to enable Continuous Delivery to Azure App Servi

Project Plan
<TODO: Project Plan

Trello Board

In my trello board I have included a simple board based flow as follows
To Do,
In Progress and
Done

Here is a link to a Trello board for the project

https://trello.com/b/vILBpJtb/machine-learning-web-application

Spreedsheet

Below is spreedsheet you will find a quarterly and yearly project plan with an estimated week by week deliverables and an estimated time difficulity for each task.

[Spreedsheet.xlsx](https://github.com/OmmySaleh/MyDevOpsRepo/files/9478500/Spreedsheet.xlsx)


Architectural Diagram (Shows how key parts of the system work)>

![Screenshot 2022-09-02 at 15 04 38](https://user-images.githubusercontent.com/110615576/188156330-3963226a-997e-4943-bef3-c7e97cf5944e.png)


Status

[![Actions Status](https://github.com/OmmySaleh/MyDevOpsRepo/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)](https://github.com/OmmySaleh/MyDevOpsRepo/actions)



CI: Set Up Azure Cloud Shell

I first created a GitHub Repo then generated a ssh-keys in my Azure Cloud Shell environment after which i clone the newly created repo into Azure Cloud Shell, screenshot below

![GitHub Cloned](https://user-images.githubusercontent.com/110615576/188479980-f5d07687-cc11-463f-a86f-cfd1a66589ef.png)

![Screenshot 2022-09-02 at 17 36 48](https://user-images.githubusercontent.com/110615576/188188159-fbfe6c61-4a50-45a4-a00b-4eaabe3a30b0.png)

Passing tests that are displayed after running the make all command from the Makefile

Local test

(.myrepo) odl_user [ ~/MyDevOpsRepo ]$ make all


![TestPassed](https://user-images.githubusercontent.com/110615576/188482645-31feb74e-6391-48ad-9e5e-d87cd1ba1a5f.png)


Output of a test run

Testing it locally to check the prediction by running python app.py and running ./make_prediction.sh to see the prediction locally


(.myrepo) odl_user [ ~/MyDevOpsRepo ]$ python app.py


![Image 28 08 22 at 22 47](https://user-images.githubusercontent.com/110615576/188171988-3d47df79-3400-424f-8518-a21f6b8a050b.jpg)


(.myrepo) odl_user [ ~/MyDevOpsRepo ]$ ./make_prediction.sh


![Screenshot 2022-08-29 at 23 14 45](https://user-images.githubusercontent.com/110615576/188172759-f39a92f9-cf7c-4cf4-83f2-9fa502103b0c.jpg)


CI: Configure GitHub Actions

This is to create a gitHub Actions to test the project upon change events in GitHub. This is a necessary step to performing Continuous Integration remotely.

I enabled Github Actions and replace yml code with below:

name: Python application test with Github Actions

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Set up Python 3.5
      uses: actions/setup-python@v1
      with:
        python-version: 3.5
    - name: Install dependencies
      run: |
        make install
    - name: Lint with pylint
      run: |
        make lint
    - name: Test with pytest
      run: |
        make test

Lastly i put the changes to GitHub and verify both lint and test

See screenshot below

![Screenshot 2022-09-02 at 16 44 04](https://user-images.githubusercontent.com/110615576/188174657-99ff495a-f714-4fda-8655-5a464630440d.png)


Continuous Delivery on Azure

Final step in the project is to set Continuous Delivery using Azure technologies. This will involve setting up Azure Pipelines to deploy the Flask starter code to Azure App Services.

![Screenshot 2022-09-02 at 16 47 20](https://user-images.githubusercontent.com/110615576/188175495-0f80a9fc-cde7-41ed-be9b-2684574339c8.png)


I deployed the web app to azure using az webapp up -n


(.myrepo) odl_user [ ~/MyDevOpsRepo ]$ az webapp up -n ommyproject2


![Image 28 08 22 at 23 04](https://user-images.githubusercontent.com/110615576/188177623-9711a029-b8bc-4736-83ac-9c1f5ec0ad8b.jpg)


Check if the app is up and running by opening the URL containing the webapp name provided in the previous step:
https://ommyproject2.azurewebsites.net/


![SklearnPredictHome](https://user-images.githubusercontent.com/110615576/188485707-487ea116-179b-4af2-bc1b-c7e17ca94015.png)


You can edit the file 'make_predict_azure_app.sh' and replace '< yourappname >' with your webapp name (e.g. azurecicdpipeline).

Logs of my running webapp via Azure Cloud shell


(.myrepo) odl_user [ ~/MyDevOpsRepo ]$ az webapp log tail


![testRunning](https://user-images.githubusercontent.com/110615576/188486535-b5798239-f5b4-470b-8ba2-d869cc7b3ae7.png)


(.myrepo) odl_user [ ~/MyDevOpsRepo ]$ locust -f locustfile.py --headless -u 20 -r 5 -t 20s


![locustTest](https://user-images.githubusercontent.com/110615576/188487067-0ae4882b-ece1-4fda-bc0c-2e5f189a2334.png)


Setting up CI/CD using Azure Pipelines

Goto Azure DevOps Organizations, create a new project called Project2
Ensure you set up a new service connection via Azure Resource Manager and Pipeline
Goto organizations setting > new service connection (under pipeline) > Azure Resource Manager
Next, select Pipeline and create a new one
Create the GitHub Integration
Configure python to Linux Web app on Azure
Set up the continuous delivery workflow


I created a new Project on Azure DevOps Organizations  called Project2


![Project2](https://user-images.githubusercontent.com/110615576/188489045-0f914aa8-cbe2-4b12-b304-185a6da6d23a.png)


Setting up a new Azure service Connection


![AzureServiceConnection](https://user-images.githubusercontent.com/110615576/188489524-0851bb45-73a1-49de-bdc0-155480d5485f.png)


Creating Personal Access Tokens


![PersonalAccessToken](https://user-images.githubusercontent.com/110615576/188489865-00ac579a-c8a6-49e1-ad03-f457ea66de87.png)


Creating an Agent Pool named myAgentPool


![MyAgentPool](https://user-images.githubusercontent.com/110615576/188490039-fe3cf7df-592f-4235-8893-22fc2a2c7114.png)


Creating a Linux Virtual Machine and configuring it as an Azure DevOpsBuild Agent 


![LinuxVM](https://user-images.githubusercontent.com/110615576/188490516-f9481307-2185-4736-8b94-e9b1ab59170c.png)


Comfirmed self-hosted Agent is online

![AgentPoolActive](https://user-images.githubusercontent.com/110615576/188490734-bf337984-7a84-45c7-ab5d-34caac5827db.png)


Setting up AzureDevOps Pipeline

![AzureAppService](https://user-images.githubusercontent.com/110615576/188491004-d4937661-1099-4ddb-85ce-9bb626be2f7d.png)


Successfull Build and Deploy on Azure Pipeline

![Deploy](https://user-images.githubusercontent.com/110615576/188491258-ccd03212-5b18-42d5-b377-58f8177790d2.png)

Jobs and Azure Web App Service Deployed

![DeployActions](https://user-images.githubusercontent.com/110615576/188491484-d83860c9-9131-4ceb-9b59-dbd94e2478b4.png)


![AzureWebAppServiceDeployed](https://user-images.githubusercontent.com/110615576/188491386-0d802ff1-af39-4bc3-b362-44001b4563c6.png)


![PipeLines](https://user-images.githubusercontent.com/110615576/188491641-882f1d80-2eb0-445a-941e-bd5f5392e33d.png)



From now on every change to your code will trigger the CI/CD pipeline and update your webapp accordingly

Successful prediction from deployed flask app in Azure Cloud Shell. Use this file as a template for the deployed prediction. The output should look similar to this:

(.myrepo) odl_user [ ~/MyDevOpsRepo ]$ ./make_predict_azure_app.sh

Port: 443
{"prediction":[20.35373177134412]}
Output of streamed log files from deployed application

![MakePredictAzureAppTest](https://user-images.githubusercontent.com/110615576/188492001-d7833c31-5dbf-4e72-bcb7-f61d18db542d.png)



Enhancements

Further improvement on the user interface of the application to make it user friendly.
Users can eastly use a click button for prediction

Demo
Here is the youtube link of my video presentation.
https://youtu.be/WGMl296fy6I

[![Actions Status](https://github.com/OmmySaleh/MyDevOpsRepo/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)](https://github.com/OmmySaleh/MyDevOpsRepo/actions)

