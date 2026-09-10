#!/bin/bash
sudo mkdir -p /etc/ansible/roles/disable_root_login/tasks
sudo mkdir -p /etc/ansible/roles/disable_root_login/handlers
sudo tee /etc/ansible/roles/disable_root_login/tasks/main.yml >/dev/null <<'EOF'
---
- name: Disable SSH root login
  ansible.builtin.lineinfile:
    path: /etc/ssh/sshd_config
    regexp: '^#?\s*PermitRootLogin\s+'
    line: 'PermitRootLogin no'
    validate: '/usr/sbin/sshd -t -f %s'
  notify: Restart SSH
EOF
sudo tee /etc/ansible/roles/disable_root_login/handlers/main.yml >/dev/null <<'EOF'
---
- name: Restart SSH
  ansible.builtin.service:
    name: ssh
    state: restarted
EOF
