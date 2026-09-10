#!/bin/bash
sudo mkdir -p /etc/systemd/system/foreman.service.d
sudo tee /etc/systemd/system/foreman.service.d/puma-workers.conf >/dev/null <<'EOF'
> [Service]
> Environment=FOREMAN_PUMA_WORKERS=2
> EOF
sudo systemctl daemon-reload
sudo systemctl restart foreman
