FROM frappe/erpnext:version-15

USER root
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

USER frappe
WORKDIR /home/frappe/frappe-bench

# Get your custom app
RUN bench remove-app frappe
RUN bench remove-app erpnext

# Build assets
RUN bench build
