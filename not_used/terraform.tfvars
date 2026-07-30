# -- Variables ---------------------------------------------

# Prefix to all resources created by terraform
prefix="litellm"

# IP Range that can access port like 80/443 on the internet. Typically:
#   - All internet - 0.0.0.0/0
#   - or <your_laptop_ip>/32. Get your Laptop IP, by example, using https://whatismyipaddress.com
public_ip_filter="__TO_FILL__"

# Compartment
compartment_ocid="__TO_FILL__"

