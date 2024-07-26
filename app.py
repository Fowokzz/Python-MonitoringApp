import psutil #To get  CPU & Memory metric
from flask import Flask, render_template  #To create the app and add style to application

app = Flask(__name__)

@app.route("/") #To run on home path
def index():
    cpu_percent = psutil.cpu_percent()
    mem_percent = psutil.virtual_memory().percent
    Message = None
    if cpu_percent > 80 or mem_percent > 80:
        Message = "High CPU & Memory Utilization detected. Scale up"
    return render_template("index.html", cpu_percent=cpu_percent, mem_percent=mem_percent, message=Message)
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")     