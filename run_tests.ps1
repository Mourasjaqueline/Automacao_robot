# run_tests.ps1
robot --outputdir results --listener allure_robotframework testjaque.robot
allure generate results -o allure-report --clean
Start-Process "allure-report\index.html"



