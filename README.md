# Python-Git-Linux-Rattrapage

Dashboard Dash application which displays randomly one out of twenty course questions. You can evaluate answer to check if the answer matches perfectly or if it contains the keywords. You can also get another random question. The server is hosted on a AWS Linux virtual machine.

## Production

- AWS URL: http://13.50.245.140/ or http://ec2-13-50-245-140.eu-north-1.compute.amazonaws.com

## Usage


* Clone this repository, from your local machine:
  ```bash
  git clone https://github.com/LynaMOSTEFACHAA/LynaMOSTEFACHAA-Python-Git-Linux-Rattrapage.git
  ```
* Get the requirements
  ```bash
  # Install requirements with pip
  pip install -r requirements.txt
  #or just pip install every import e.g. dash:
  pip install dash
  ```

* Start the application (adapt the following path or go to your cloned directory)
  ```bash
  $ sudo python3 CourseTest.py
  ```
  or
    ```bash
  $ nohup python3 CourseTest.py &
  ```

* Important: If you use it locally, do not forget to adapt all paths in the application CourseTest.

## Author

- Lyna MOSTEFA CHAA: lyna.mostefa_chaa@edu.devinci.fr


## 📚​ Documentation

Dash: https://dash.plotly.com

Python libraries: https://docs.python.org/fr/3/library/