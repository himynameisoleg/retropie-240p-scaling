# RetroPie 240p Scaling Settings for Composite Output
The following consolidated guide and source files based on [this](https://retropie.org.uk/forum/topic/11628/240p-and-mame-scaling/11) post. 

We are able to get better quality 240p signal scaling out of the built in composite output in most Raspberry Pi models. Pi 2 and 3 have a 3.5mm jack and even the Pi Zero has "TV" pins you can solder an RCA cable to. 

This guide assumes you have RetroPie installed with WiFi and SSH enabled. 

## Transfering Files
The fastest way to transfer files over SSH is using FileZilla, although there are plenty of other clients that will do the trick. We will need to transfer (and overwrite) several files.

Firstly replace **config.txt** with the one provided, found in:
```
/boot/config.txt
```

If you do not want to overwrite your config file then simply update:
```
disable_overscan=1
```


Next copy the following to the derectory: 
- **retroarch.cfg**
- **runcommand-onend.sh**
- **runcommand-onstart.sh**

```
/opt/retropie/configs/all/
```

Copy over **pi_iq_horz_nearest_vert.glslp** to:

```
/opt/retropie/configs/all/retroarch/shaders/
```

Lasty copy over:

- **pi_iq_horz_nearest_vert.glsl**
- **pi_iq_horz_nearest_vert_GBA.glsl** 

```
/opt/retropie/configs/all/retroarch/shaders/shaders/
```

## Adjusting Custom Aspect Ratio

1. Load a ROM
2. Press SELECT + X to open the RetroArch menu
3. Go to Settings > Video
4. Set height to 480 (if its not already set by default)
5. Set width to 660

660 x 480 seems to work best on my Sony PVM 1343MD with the SNES and Master System cores but feel free to play around with the width value until yours looks right. Some cores may be [448 | 480] x [660 - 700] so feel free to adjust on a per system/core basis.

When you load into a ROM the grey menu screen will appear noticably worse and and letters will become virtually unredable. The letterboxing should be gonee now and the scaling in games will look much better and more true to the original CRT composite aesthetic. 

Happy Tinkering! 