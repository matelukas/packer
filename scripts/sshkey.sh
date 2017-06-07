#!/bin/sh -e

tee /tmp/id_rsa.pub <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgTn3aro4+l2VhRK+h352RPLccrn8kk2nR0LdS0eui5M9u/3nACPXyLYah8UDdw4tNa9iqS3E3FrHNswxVn6ESWkm8CkQaUDbMYPaKhlx4wR2uqP7aTvQz0td80NwuMxo8bVKWSE8Nx8oM7KwuZxg+7egR4jLpSGV/yvvVPwAwl2qM49Ecy6y8Eoof7NGjKqnsCiuo2ZQXsow1MOOte4m8o+rUA14TMwcTiD5Y0NxWTHNaAkMPcU31bejQFWOXMGUTv6hgDtu1+TQ0bHwror1+ljsfdSb9zMsbDdPtE2ZTvtgvzlJ2umVkR3upSDDxwIw2jwNHe/LNnrjnUgsyX08j hi@there
EOF

sudo rm -rf /root/.ssh/* || true
sudo -H -u root -- mkdir -p /root/.ssh/
sudo -H -u root -- chmod 700 /root/.ssh/
sudo -H -u root -- cp /tmp/id_rsa.pub /root/.ssh/authorized_keys
sudo -H -u root -- chown root:root /root/.ssh/authorized_keys
sudo -H -u root -- chmod 600 /root/.ssh/authorized_keys

sudo rm -rf /home/ubuntu/.ssh/* || true
sudo -H -u ubuntu -- mkdir -p /home/ubuntu/.ssh/
sudo -H -u ubuntu -- chmod 700 /home/ubuntu/.ssh/
sudo -H -u ubuntu -- cp /tmp/id_rsa.pub /home/ubuntu/.ssh/authorized_keys
sudo -H -u ubuntu -- chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys
sudo -H -u ubuntu -- chmod 600 /home/ubuntu/.ssh/authorized_keys

