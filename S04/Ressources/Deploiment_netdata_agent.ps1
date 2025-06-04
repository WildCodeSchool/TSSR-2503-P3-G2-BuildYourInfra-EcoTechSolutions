$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest https://github.com/netdata/netdata/releases/latest/download/netdata-x64.msi -OutFile "netdata-x64.msi"
msiexec /qn /i netdata-x64.msi TOKEN=xfoAal-mTQVXQcJMvCtrAuIpUYdIz-MLx23wXF9-yQ6BEHaKzLb1zXTw6d0m_R8W9qVJ31iG7YM7DBiRcyqHi67zeDpfimoBrjHYmHFU9oc749dYyO_rwNAW5AAhsoiNlYI_lhc ROOMS=abc75ee0-d4ef-4387-9157-7362ec086bfa