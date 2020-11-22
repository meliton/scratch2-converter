# Converts a Scratch 2 file to an EXE 

Scratch is a block-based visual programming language targeted at children to help learn code.<br>
This converter will port the `.sb2` file created by the software into an SWF file and then combines it into a stand-alone executable file.<br><br>


This technique leverages `Converter.swf` to convert the `.sb2` file to `.swf`.<br>
You can download Converter.swf from https://asentientbot.github.io/ <br><br>

It also leverages `flashplayer_32_sa.exe` (Flash Player projector).<br>
You can download the latest Flash Player projector from https://www.adobe.com/support/flashplayer/debug_downloads.html <br><br>

## How to use
- Place `Converter.swf` and `flashplayer_32_sa.exe` in the `/bin` folder.
- Place the `.sb2` file you want to convert next to the batch file.
- Run `scratch2_to_exe.bat` to convert the `.sb2` file
