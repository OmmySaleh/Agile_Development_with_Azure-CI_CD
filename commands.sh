Generate sshkeys using commanf: $ ssh-keygen -t rsa
Create a file using command: $ touch <filename>
add a file using command: $ git add
commit a file using command: $ git commit -m "massage"
push a file to your GitHub repository using command: $ git push 
create the Python Virtual Environment using: 
$ python3 -m venv ~/.myrepo
$ source ~/.myrepo/bin/activate
run the test using command: $ make all
making predictions tests:  $ ./make_prediction.sh and $ ./make_predict_azure_app.sh
create a web app using command: $ az webapp up -n <app name>
log test using command: $ az webapp log tail
locust test using command: $ locust -f locustfile.py --headless -u 20 -r 5 -t 20s
