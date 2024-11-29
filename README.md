# Waveshare PoE-HAT (B) Home-Assistant Addon (forked from original)

Specifically for this PoE-HAT: https://www.waveshare.com/wiki/PoE_HAT_(B)

Home Assistant (HASS) Addon to fully support Waveshare PoE HAT B including fan control and display

This is a fork of reschix's original, with Dockerfile changes to fix errors after July 2023.

For anyone landing here, i saw that in my case I have 
/dev/i2c-0
/dev/i2c-1
/dev/i2c-10 
/dev/i2c-22 
but no /dev/i2c-11 like in original. 
I am no coder so don't know how to make this editable and therefore forked to make the changes
Works for me 

Important: Enable I2C first to make this work! As described here: https://www.home-assistant.io/common-tasks/os/#enable-i2c
