# Foreman
installer_Foreman.sh установка foreman и ansible на ubuntu 22.04
При установке была ошибка подключения E: Failed to fetch https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/openvox-agent_8.29.0-1%2bubuntu22.04_amd64.deb Connection timed out [IP: 138.199.224.35 443]
ошибка исправлена перенаправлением трафика на данный сервер через vpn тунель

fix_import_roles.sh Исправление ошибки Failed to import roles and variables Error: Request failed with status code 500 при импорте Ролей ansible

create_role.sh Создает роль по запрету входа рута
