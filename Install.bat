setlocal EnableDelayedExpansion
set "userFolder=C:\Users\%username%"

if not exist "!userFolder!\Dokumen" (
    md "!userFolder!\Tes"
    echo Folder "Dokumen" dibuat untuk pengguna %username%
)

git clone https://github.com/revan2159/SIMRSKhanza.git SIMRSKhanza