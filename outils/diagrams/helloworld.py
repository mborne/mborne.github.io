# diagram.py
from diagrams import Diagram
from diagrams.aws.compute import EC2
from diagrams.aws.database import RDS
from diagrams.aws.network import ELB

graph_attr = {
    "margin":"-1.8, -1.8"
}

with Diagram("Simple", filename="helloworld", graph_attr=graph_attr, show=False):
    ELB("lb") >> EC2("web") >> RDS("userdb")
