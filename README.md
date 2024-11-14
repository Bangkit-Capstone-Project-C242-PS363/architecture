# blueprint

## to ML devs

You now can mount bucket into your local machine and use it as a local directory to save our exported model.
See [this](https://cloud.google.com/storage/docs/cloud-storage-fuse/quickstart-mount-bucket) for more information.

### install gcloud

See [this](https://cloud.google.com/sdk/docs/install) for more information.

#### for windows users

Run it in powershell as administrator

```powershell
(New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe") & $env:Temp\GoogleCloudSDKInstaller.exe
```

#### for linux users

Linux users are used to read the documentation, right? :D. so I will not provide the command here.

### install gcsfuse

#### for windows users

use this [msi](https://github.com/weswu8/gcsfuse-win) file to install gcsfuse on windows

#### for linux users

Linux users are used to read the documentation, right? :D. so I will not provide the command here.

### mount bucket

```bash
gcloud auth application-default login #for the first time only

mkdir <folderApaPun>
gcsfuse <folderApaPun> bucket-asl-model
```

### another option

Just pull it to our github repo. I'll handle the rest.

