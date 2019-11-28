from flask import Flask, render_template, request, redirect,url_for
import pymysql 
import yaml
import requests
import smtplib, ssl
url = "https://www.fast2sms.com/dev/bulk"
smtp_server = "smtp.gmail.com"
port = 587  

app = Flask(__name__)

# Configure db
# db = yaml.load(open('db.yaml'))
# app.config['MYSQL_HOST'] = db['mysql_host']
# app.config['MYSQL_USER'] = db['mysql_user']
# app.config['MYSQL_PASSWORD'] = db['mysql_password']
# app.config['MYSQL_DB'] = db['mysql_db']
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='',
                             db='users',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)


@app.route('/users', methods=['GET', 'POST'])

def index():
    if request.method == 'POST':
        userDetails= request.form
        v_name = userDetails['v_name']
        v_email=userDetails['v_email']
        v_no=userDetails['v_no']
        h_name = userDetails['h_name']
        h_email=userDetails['h_email']
        h_no=userDetails['h_no']
        payload = "sender_id=FSTSMS&message=Visitor Name:"+v_name+" E-mail:"+v_email+" Mobile No."+v_no+" has arrived to meet you.&language=english&route=p&numbers=7477740333,"+h_no
        headers = {'authorization': "PHSQpr9C0RE1uT7cKbNxUW8eXLsfmV5wD6J3qh4tjnGiZAY2FMsUJ9ugkyhHeDoIwq4X15vOV87ctR2E", 'Content-Type': "application/x-www-form-urlencoded",'Cache-Control': "no-cache"}
        response = requests.request("POST", url, data=payload, headers=headers)
        # message = """\
        # Subject: Hi there

        # This message is sent from Python."""

        # context = ssl.create_default_context()
        # with smtplib.SMTP(smtp_server, port) as server:
        #     server.ehlo() 
        #     server.starttls(context=context)
        #     server.ehlo()  
        #     server.login(sender_email, password)# enter your email id
        #     server.sendmail(sender_email, h_email, message)
        #         print(response.text)
        cur = connection.cursor()
        cur.execute("INSERT INTO users(v_name, v_email,v_no,h_name,h_email,h_no) VALUES(%s, %s ,%s,%s, %s ,%s)",(v_name, v_email,v_no,h_name,h_email,h_no))
        connection.commit()
        cur.close()

        return redirect('/users')
    return render_template('index.html')

@app.route('/dep',methods=['GET','POST'])
def dep():
    if request.method == 'POST':
        userDetails= request.form
        v_no=userDetails['v_no']

        cur = connection.cursor()
        cur.execute("UPDATE users SET status=0 WHERE v_no=(%s) AND status=1",(v_no))

        sql_Query= "select arv from users where v_no =%s"
        cur.execute(sql_Query, v_no)
        record = cur.fetchone()
        connection.commit()
        cur.close()

        payload = "sender_id=FSTSMS&message="+record+"&language=english&route=p&numbers=7477740333,"+v_no
        headers = {'authorization': "PHSQpr9C0RE1uT7cKbNxUW8eXLsfmV5wD6J3qh4tjnGiZAY2FMsUJ9ugkyhHeDoIwq4X15vOV87ctR2E", 'Content-Type': "application/x-www-form-urlencoded",'Cache-Control': "no-cache"}
        response = requests.request("POST", url, data=payload, headers=headers)
        print(response.text)
        return redirect('/dep')
    return render_template('dep.html')
@app.route('/',methods=['GET','POST'])
def users():
   return render_template('users.html')

if __name__ == '__main__':
    app.run(debug=True)