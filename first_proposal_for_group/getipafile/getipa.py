# %%
import zipfile
import os
import shutil
import os
import zipfile

try:
    # remove the ipa file
    os.remove("Payload.ipa")
except:
    pass

# unzip the file
with zipfile.ZipFile("Runner.app.zip", 'r') as zip_ref:
    zip_ref.extractall("")

# move the app to the Payload folder
shutil.move("Runner.app", "Payload/Runner.app")

# %%
zf = zipfile.ZipFile("Payload.zip", "w")
for dirname, subdirs, files in os.walk("Payload"):
    zf.write(dirname)
    for filename in files:
        zf.write(os.path.join(dirname, filename))
zf.close()

# %%
# rename the zip file to ipa
os.rename("Payload.zip", "Payload.ipa")

print("done")
