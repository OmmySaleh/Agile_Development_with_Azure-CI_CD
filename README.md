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
(.CI-CDpipeline) lawal@Azure:~/CI-CDpipeline$ make all

![Image 28 08 22 at 19 38 2](https://user-images.githubusercontent.com/110615576/188171026-c3432af9-ffcf-442e-bc07-a4d658081a62.jpg)

Output of a test run

Testing it locally to check the prediction by running python app.py and running ./make_prediction.sh to see the prediction locally

![Image 28 08 22 at 22 47](https://user-images.githubusercontent.com/110615576/188171988-3d47df79-3400-424f-8518-a21f6b8a050b.jpg)


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

![Image 28 08 22 at 23 04](https://user-images.githubusercontent.com/110615576/188177623-9711a029-b8bc-4736-83ac-9c1f5ec0ad8b.jpg)

![Screenshot 2022-08-28 at 22 57 01](https://user-images.githubusercontent.com/110615576/188179100-8011f748-56b4-4d5a-98c0-9c518e57a0db.jpg)

Yiu can edit the file 'make_predict_azure_app.sh' and replace '< yourappname >' with your webapp name (e.g. azurecicdpipeline).

Logs of my running webapp via Azure Cloud shell

(.CI-CDpipeline) lawal@Azure:~/CI-CDpipeline$ az webapp log tail

![Screenshot 2022-08-31 at 19 29 01](https://user-images.githubusercontent.com/110615576/188179944-e8f1ad01-a104-4f03-a062-aee7e22890f9.png)


![Screenshot 2022-09-02 at 17 14 29](https://user-images.githubusercontent.com/110615576/188180665-45547843-f54b-47c9-9957-d913b9787b76.png)


Setting up CI/CD using Azure Pipelines

Goto Azure DevOps Organizations, create a new project called CICDAzuredev
Ensure you set up a new service connection via Azure Resource Manager and Pipeline
Goto organizations setting > new service connection (under pipeline) > Azure Resource Manager
Next, select Pipeline and create a new one
Create the GitHub Integration
Configure python to Linux Web app on Azure
Set up the continuous delivery workflow

![Screenshot 2022-08-31 at 19 11 29](https://user-images.githubusercontent.com/110615576/188181685-f3177cd0-8862-4884-939f-c1959d62389d.png)

From now on every change to your code will trigger the CI/CD pipeline and update your webapp accordingly

Successful prediction from deployed flask app in Azure Cloud Shell. Use this file as a template for the deployed prediction. The output should look similar to this:

udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
Output of streamed log files from deployed application

![Screenshot 2022-08-29 at 23 53 39 2](https://user-images.githubusercontent.com/110615576/188183713-bd4495d1-e3d7-4022-ad14-45dded946db4.jpg)


Enhancements

Further improvement on the user interface of the application to make it user friendly.
Users can eastly use a click button for prediction

Demo
Here is the youtube link of my video presentation.
https://youtu.be/VbqdOUfPYi4

[![Actions Status](https://github.com/OmmySaleh/MyDevOpsRepo/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)](https://github.com/OmmySaleh/MyDevOpsRepo/actions)

