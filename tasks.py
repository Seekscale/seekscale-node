from __future__ import absolute_import
from celery.exceptions import SoftTimeLimitExceeded
from worker.celery import app
import ntpath
import time
import os
import sys
import json
from ruamel.yaml import YAML
import shutil
import datetime
import zipfile
import paramiko
import subprocess
import requests
import json
import datetime
from urlparse import urlparse

@app.task(name='test', soft_time_limit=7200, max_retries=1)
def test():
    taskId = test.request.id

    rootFolder = "/home/" + taskId
    print("hello world")

    return "SUCCESS"
