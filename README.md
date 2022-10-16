# RetroPie 240p Scaling Settings for Composite Output
The following is a consolidated guide with source files based on [this](https://retropie.org.uk/forum/topic/11628/240p-and-mame-scaling/11) post. 

We can get improved 240p scaling out of the built in composite analog output in most Raspberry Pi models. Pi 2 and 3 have a 3.5mm jack and even the Pi Zero has "TV" pins you can solder an RCA cable to. With a few configuration changes we can get native 240p composite output during emulation.

This guide assumes you have RetroPie installed, connected to a Wifi network and have SSH enabled. 

## Transfering Files
A quick way to transfer files wirelessly over SSH is using FileZilla. There are plenty of other clients that will do the trick as well so use your favorite. We will need to transfer (and overwrite) several files and configurations that will enable 240p during emulation and higher resolutions for menu legibility. 

## Updating Raspberry Pi Configs

Download the files from this repo and connect to your Pi using FileZilla. Once connected we will need to transfer these files to the appropriate directory.

Firstly replace **config.txt** with the one provided, found in:
```
/boot/config.txt
```

If you do not want to overwrite your config.txt file then simply update:
```
disable_overscan=1
```


Next copy the following configs over. These set a resolution of 720 x 480 and, during emulation, throw out half of the lines. This effectively gives a 240p resoluton.  
- **retroarch.cfg**
- **runcommand-onend.sh**
- **runcommand-onstart.sh**

```
/opt/retropie/configs/all/
```

Copy over **pi_iq_horz_nearest_vert.glslp** to the following directory:

```
/opt/retropie/configs/all/retroarch/shaders/
```

Lastly copy over:

- **pi_iq_horz_nearest_vert.glsl**
- **pi_iq_horz_nearest_vert_GBA.glsl** 

```
/opt/retropie/configs/all/retroarch/shaders/shaders/
```

Restart your Pi and continue to the next section.


## Adjusting Custom Aspect Ratio

1. Load a ROM
2. Press SELECT + X to open the RetroArch menu
3. Go to Quick Menu > Save Core Overrides (make sure our settings get saved)
4. Go to Settings > Video
5. Set Aspect Ratio to Custom
6. Set height to 480 (if its not already set by default)
7. Set width to 660

660 x 480 seems to work best on my Sony PVM 1343MD with the SNES and Master System cores. Some cores may be [448 | 480] x [660 - 700] so feel free to adjust on a per system/core basis until yours looks right. 

You may have noticed that after loading into a ROM the grey menu screen will appear noticably worse and menu text has become virtually unredable. This is evidence that things are working! Additionally the black letterboxing should be gone and the scaling in games will look much more true to the original and fit the entire height of your CRT.

Happy Tinkering! 