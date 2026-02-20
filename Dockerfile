FROM frappe/erpnext:version-15

USER root
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

USER frappe
WORKDIR /home/frappe/frappe-bench

# Get your custom app
RUN bench get-app https://github.com/indsys-dev/site-job-management.git

# Build assets
RUN bench build
