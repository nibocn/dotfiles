#!/usr/bin/env python3

import asyncio
import iterm2
import logging

logging.basicConfig(filename='/tmp/switch_theme.log',
    format='%(asctime)s [%(levelname)s] %(message)s', level=logging.INFO)
logging.info("Start...")

async def update(connection, theme):
    # Themes have space-delimited attributes, one of which will be light or dark.
    logging.info('Theme info: %s', theme)
    parts = theme.split(" ")
    if "dark" in parts:
        # preset = await iterm2.ColorPreset.async_get(connection, "edge-dark-neon")
        preset = await iterm2.ColorPreset.async_get(connection, "everforest-dark")
        logging.info('切换到 Dark 主题')
    else:
        # preset = await iterm2.ColorPreset.async_get(connection, "edge-light")
        preset = await iterm2.ColorPreset.async_get(connection, "everforest-light")
        logging.info('切换到 Light 主题')

    # Update the list of all profiles and iterate over them.
    profiles=await iterm2.PartialProfile.async_query(connection)
    for partial in profiles:
        # Fetch the full profile and then set the color preset in it.
        profile = await partial.async_get_full_profile()
        await profile.async_set_color_preset(preset)
    logging.info("Done.")

async def main(connection):
    # app = await iterm2.async_get_app(connection)
    # await update(connection, await app.async_get_variable("effectiveTheme"))
    async with iterm2.VariableMonitor(connection, iterm2.VariableScopes.APP, "effectiveTheme", None) as mon:
        while True:
            # Block until theme changes
            theme = await mon.async_get()
            await update(connection, theme)

iterm2.run_forever(main)
