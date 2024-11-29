# Waveshare PoE-HAT (B) Home-Assistant Addon (forked from original)

Specifically for this PoE-HAT: https://www.waveshare.com/wiki/PoE_HAT_(B)

Home Assistant (HASS) Addon to fully support Waveshare PoE HAT B including fan control and display

This is a fork of reschix's original, with Dockerfile changes to fix errors after July 2023.

For anyone landing here, on my system i saw i have 
/dev/i2c-0
/dev/i2c-1
/dev/i2c-10
/dev/i2c-22
but in the original code it has /dev/i2c-11. 
I am no coder and does not know how to make this changable, so i forked to make the change and for me it works
Credit goes to original code, i just used a hammer to make the triangle fit in the round hole

Important: Enable I2C first to make this work! As described here: https://www.home-assistant.io/common-tasks/os/#enable-i2c
