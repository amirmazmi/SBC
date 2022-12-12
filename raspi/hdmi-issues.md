# HDMI output issues for raspi

source: https://gist.github.com/amitsaha/3804320
  
  
**Pretends HDMI hotplug signal is asserted so it appears a HDMI display is attached**  
&nbsp;&nbsp; hdmi_force_hotplug=1


**Configure the signal strength of the HDMI interface**  
&nbsp;&nbsp; config_hdmi_boost=5


**Comment the following option**
```
# Enable DRM VC4 V3D driver
#dtoverlay=vc4-kms-v3d
```
